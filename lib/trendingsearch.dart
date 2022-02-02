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

  List? data;
  String? search;

  getTextInputData(){
    setState(() {
      search = _search.text;
    });
  }
  final imagesListKey = GlobalKey<_SearchWidgetState>();

  late final ImageData imageData;

  @override
  void initState() {
    super.initState();
    getImagesList();
  }

  Future<String> getImagesList() async {
    if(search != null){
      var response= await http.get(
          Uri.parse('https://api.unsplash.com/search/photos?per_page=30&client_id=..,&query=$search'));

      setState(() {
        var converted = json.decode(response.body);
        data=converted['results'];
    });
    }
    else{
      return 'Search';
    }
    return 'success';
  }

  // Future<List<ImageData>> getImagesList() async {
  //   final response = await http.get(
  //       Uri.parse('https://api.unsplash.com/search/photos?per_page=30&client_id=&query=$result'));
  //
  //   if (response.statusCode == 200) {
  //     final items = jsonDecode(response.body);
  //     List<ImageData> images = items.map<ImageData>((json) {
  //       return ImageData.fromJson(json);
  //     }).toList();
  //     return images;
  //   } else {
  //     throw Exception('Failed to load Data');
  //   }
  // }

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
                hintText: "Search for Images",
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
              onChanged: (value) {
                setState(() {
                  search= value;
                });
                getImagesList();
              },
            ),
            titleSpacing: 0,
            elevation: 0,
            // actions: <Widget>[
              // IconButton(
              //   icon: const Icon(Icons.search),
              //   onPressed: getTextInputData,
              // ),
            // ],
          ),
      body: search == null ? Container():
          GridView.builder(
            gridDelegate: SliverQuiltedGridDelegate(
              crossAxisCount: 4,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              repeatPattern: QuiltedGridRepeatPattern.inverted,
              pattern: const [
                QuiltedGridTile(2, 2),
                QuiltedGridTile(1, 1),
                QuiltedGridTile(1, 1),
                QuiltedGridTile(1, 1),
                QuiltedGridTile(1, 1),
              ],
            ),
            itemCount: data == null ?0:data!.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius : const BorderRadius.all(Radius.circular(3)),
                    color : const Color.fromRGBO(230, 230, 230, 1),
                    image : DecorationImage(
                      image: NetworkImage(data![index]['urls']['small']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context, MaterialPageRoute(
                      builder: (BuildContext context) => DetailsWidget(imageData: (data![index]['urls']['small']),),
                    ),
                  );
                },
              );
            },
          )
    );
  }

}
