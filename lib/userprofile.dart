import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:sp/imagedata.dart';

import 'details.dart';

class ProfilePhotosWidget extends StatefulWidget  {

  final ImageData userName;
  final ImageData name;
  final ImageData profile;

  const ProfilePhotosWidget({Key? key, required this.userName, required this.profile, required this.name}) : super(key: key);

  @override
  _ProfilePhotosWidgetState createState() => _ProfilePhotosWidgetState();
}

class _ProfilePhotosWidgetState extends State<ProfilePhotosWidget> {

  late Future<List<ImageData>> images;

  final imagesListKey = GlobalKey<_ProfilePhotosWidgetState>();

  late final String username ;

  @override
  void initState() {
    super.initState();
    images = getImagesList();
    username = widget.userName.username;
  }

  Future<List<ImageData>> getImagesList() async {
    final response = await http.get(
        Uri.parse('https://api.unsplash.com/users/$username/photos/?client_id=...&per_page=30&page='));
    if (response.statusCode == 200) {
      final items = jsonDecode(response.body);
      List<ImageData> images = items.map<ImageData>((json) {
        return ImageData.fromJson(json);
      }).toList();
      return images;
    } else {
      throw Exception('Failed to load Data');
    }
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    final double itemHeight = size.height / 5;
    final double itemWidth = size.width / 2.8;

    return Scaffold(
      key: imagesListKey,
      body: Stack(
      children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
                const SizedBox(height: 30),
                Container(
                  height: 80.0,
                  width: 80.0,
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    boxShadow : const [BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        offset: Offset(0,0),
                        blurRadius: 2
                    )],
                    image:  DecorationImage(
                      image: NetworkImage(widget.profile.profileImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(widget.name.name,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 22,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 20),
              ]
            ),

      Flexible(
      child: FutureBuilder<List<ImageData>>(
        future: getImagesList(),
        builder: (BuildContext context, AsyncSnapshot<List<ImageData>> snapshot) {
          if(snapshot.hasData && snapshot.data!.isNotEmpty){
            return GridView.builder(
              itemCount: snapshot.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (BuildContext context, int index) {
                var data = snapshot.data![index];

                return InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Container(
                        height : itemHeight,
                        width : itemWidth,
                        decoration: BoxDecoration(
                          borderRadius : const BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                          color : const Color.fromRGBO(230, 230, 230, 1),
                          image : DecorationImage(
                            image: NetworkImage(data.thumbnail),
                            fit: BoxFit.cover,
                          ),
                        ),
                    ),
                  ),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return FractionallySizedBox(
                          heightFactor: 0.96,
                          child: DetailsWidget(imageData: data,)
                        );
                      }
                    );
                  },
                );
              },
            );
          }
          else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Color(0xffadadad),
                valueColor: AlwaysStoppedAnimation(Color(0xff000000)),
                semanticsLabel: 'wait a while',
              )
          );
        },
      ),
      ),
      ]
      ),
        Positioned(
          left: 20.0,
          top: 35.0,
          child: GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                radius: 16.0,
                backgroundColor: Theme.of(context).primaryColorLight,
                child: Icon(Icons.arrow_back_ios_rounded,
                    color: Theme.of(context).primaryColorDark,
                    size: 22
                ),
              ),
            ),
          ),
        ),
      ]
      )
    );
  }
}