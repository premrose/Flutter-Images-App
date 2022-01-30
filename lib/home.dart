import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:http/http.dart' as http;

import 'package:sp/imagedata.dart';
import 'details.dart';
import 'favorites.dart';

void main() {
  runApp( const HomeWidget() );
}

class HomeWidget extends StatefulWidget  {
  const HomeWidget({Key? key}) : super(key: key);
  
  @override
  _MyStatefullWidgetState createState() => _MyStatefullWidgetState();
}

class _MyStatefullWidgetState extends State<HomeWidget> {

  late Future<List<ImageData>> images;

  final imagesListKey = GlobalKey<_MyStatefullWidgetState>();

  @override
  void initState() {
    super.initState();
    images = getImagesList();
  }
  List<String> likedImages = <String>[];

  Future<List<ImageData>> getImagesList() async {
    final response = await http.get(
        Uri.parse('https://api.unsplash.com/photos/?client_id=...&per_page=30&page='));

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
    final double itemHeight = size.height / 3;
    final double itemWidth = size.width / 2.1;

    return Scaffold(
      key: imagesListKey,
      body: FutureBuilder<List<ImageData>>(
        future: images,
        builder: (BuildContext context, AsyncSnapshot<List<ImageData>> snapshot) {
          if(snapshot.hasData){
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.70,
              ),
              itemBuilder: (BuildContext context, int index) {
                var data = snapshot.data![index];
                String save = data.thumbnail;
                bool liked = likedImages.contains(save);

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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children:[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children:[
                              Container(),
                            IconButton(
                              icon: Icon( liked ?Icons.favorite: Icons.favorite,
                                color: liked ? Colors.red.withOpacity(0.8) :Colors.white.withOpacity(1), size: 22.0),
                              onPressed: () {
                                setState(() {
                                  if (liked) {
                                    likedImages.remove(save);
                                  } else {
                                    likedImages.add(save);
                                  }
                                });

                              }
                              ),
                            ]
                          )
                        ]
                      )
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
                  });
                    },
                );
              },
            );
          }
          else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          // By default, loading spinner.
          return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Color(0xffadadad),
                valueColor: AlwaysStoppedAnimation(Color(0xff000000)),
                semanticsLabel: 'wait a while',
              )
          );
        },

      ),
    );
  }

  Future pushToFavoriteWordsRoute(BuildContext context) {
    return Navigator.push(
          context, MaterialPageRoute(
          builder: (BuildContext context) =>  FavouriteWidget(
            favoriteItems: likedImages,
        ),
      ),
    );
  }

}
