import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sp/imagedata.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';

import 'details.dart';

void main() {
  runApp(const SearchWidget());
}

class SearchWidget extends StatefulWidget  {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {

  final _search = TextEditingController();

  String result = '';

  getTextInputData(){
    setState(() {
      result = _search.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: TextFormField(
              maxLines : 1,
              expands : false,
              enableSuggestions : true,
              controller: _search,
              decoration: const InputDecoration(
                hintText: "Search Products or Accounts",
                hintStyle: TextStyle(
                  color: Color.fromRGBO(146, 146, 146, 0.7300000190734863),
                  fontFamily: 'Roboto',
                  fontSize: 16,
                ),
                contentPadding : EdgeInsets.all(8),
                disabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0, color: Colors.transparent)),
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0, color: Colors.transparent,)),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0, color: Colors.transparent,)),
                focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.red,)),
              ),
              onChanged: (value) => result = value,
            ),
            titleSpacing: 0,
            elevation: 0,
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: getTextInputData,
              ),
            ],
          ),
      body: SearchBarWidget(imageList: result),
    );
  }

}

class SearchBarWidget extends StatefulWidget  {

  String? imageList;

  SearchBarWidget({Key? key, required this.imageList}) : super(key: key);

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {

  late Future<List<ImageData>> images;

  final imagesListKey = GlobalKey<_SearchBarWidgetState>();

  late final ImageData imageData;

  static const pattern = [
    QuiltedGridTile(2, 2),
    QuiltedGridTile(1, 1),
    QuiltedGridTile(1, 1),
    QuiltedGridTile(1, 2),
  ];

  get imageList => imageList;


  @override
  void initState() {
    super.initState();
    images = getImagesList();
  }

  Future<List<ImageData>> getImagesList() async {
    final response = await http.get(
        Uri.parse('https://api.unsplash.com/search/photos?per_page=30&client_id=...&query=$imageList'));

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
    return FutureBuilder<List<ImageData>>(
            future: images,
            builder: (BuildContext context, AsyncSnapshot<List<ImageData>> snapshot) {
              if(snapshot.hasData){
                if(snapshot.data != null) {
                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.70,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      var data = snapshot.data![index];
                      return InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Container(
                            height : 300,
                            width : 150,
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
                          Navigator.push(
                            context, MaterialPageRoute(
                            builder: (BuildContext context) => DetailsWidget(imageData: data,),
                          ),
                          );
                        },
                        // onDoubleTap: () {
                        //   Navigator.push(
                        //     context, MaterialPageRoute(
                        //     builder: (BuildContext context) => FavouriteWidget(),
                        //   ),
                        //   );
                        // },
                        // onLongPress: () {
                        //   Navigator.push(
                        //     context, MaterialPageRoute(
                        //     builder: (BuildContext context) => CartWidget(),
                        //   ),
                        //   );
                        // },


                      );
                    },
                  );
                }else {
                  return const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Color(0xffadadad),
                        valueColor: AlwaysStoppedAnimation(Color(0xff000000)),
                        semanticsLabel: 'wait a while',
                      )
                  );
                }
              }
              else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const Center(
                  child: Text('Search Images'
                  )
              );
            }
    );
  }

}
