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

  final List<String> _chipLabel = ['Latest', 'Trending', 'Wallpapers', 'Abstract', 'Animals', 'Technology', 'Nature'];

  int _selectedIndex = 0;

  final _search = TextEditingController();

  late Future<List<ImageData>> images;

  String? search= "";

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
    images = getImagesList();
  }

  Future<List<ImageData>> getImagesList() async {
    final response = await http.get(
        Uri.parse('https://api.unsplash.com/search/photos?per_page=30&client_id=...&query=$search:"latest"'));

    if (response.statusCode == 200) {
      final items = jsonDecode(response.body)['results'];
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
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          maxLines : 1,
          expands : false,
          enableSuggestions : true,
          controller: _search,
          decoration: const InputDecoration(
            hintText: "Search Images from Unsplash",
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
      key: imagesListKey,
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(7, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child:
                    ChoiceChip (
                      label: Text(_chipLabel[index]),
                      selected: _selectedIndex == index,
                      backgroundColor: Colors.black12,
                      selectedColor: const Color.fromRGBO(
                          121, 121, 121, 0.6392156862745098),
                      onSelected: (selected) {
                        if(selected){
                        setState(() {
                          _selectedIndex = index;
                          search = _chipLabel[index];
                        });}
                        getImagesList();
                      },
                    ),
                  );
                }
              ),
            ),
          ),
          Flexible(
            child: FutureBuilder<List<ImageData>>(
              future: getImagesList(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Color(0xffadadad),
                            valueColor: AlwaysStoppedAnimation(Color(0xff000000)),
                            semanticsLabel: 'wait a while',
                          )
                      );

                } else if( snapshot.hasData && snapshot.data.isNotEmpty){
                return GridView.builder(
                  itemCount: snapshot.data!.length,
                  gridDelegate: SliverQuiltedGridDelegate(
                    crossAxisCount: 4,
                    mainAxisSpacing: 3,
                    crossAxisSpacing: 3,
                    repeatPattern: QuiltedGridRepeatPattern.inverted,
                    pattern: const [
                      QuiltedGridTile(2, 2),
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(1, 1),
                    ],
                  ),
                  itemBuilder: (BuildContext context, int index) {
                      var data = snapshot.data![index];

                      return InkWell(
                        child: Container(
                              decoration: BoxDecoration(
                                borderRadius : const BorderRadius.all(Radius.circular(3)),
                                color : const Color.fromRGBO(230, 230, 230, 1),
                                image : DecorationImage(
                                  image: NetworkImage(data.thumbnail),
                                  fit: BoxFit.cover,
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
                              });
                        },  
                      );
                    },
                  );
                }
                return const Center(
                child: Text('Search for Images')
                );
              },
            ),
          )
        ]
      ),
    );
  }

}
