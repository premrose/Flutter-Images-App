import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:sp/imagedata.dart';
import 'package:sp/trendingsearch.dart';
import 'package:sp/userprofile.dart';
import 'details.dart';
import 'favorites.dart';

void main() {
  runApp( const HomeWidget() );
}

class HomeWidget extends StatefulWidget  {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<HomeWidget> {

  late Future<List<ImageData>> images;

  final imagesListKey = GlobalKey<_MyStatefulWidgetState>();

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

  Future<bool> addFavorite(String imageURL) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var favorites = preferences.getStringList("favorites") ?? [];
    favorites.add(imageURL);
    // convert list to set
    preferences.setStringList("favorites", favorites);
    return true;
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    final double itemHeight = size.height / 3;
    final double itemWidth = size.width / 2.1;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 55,
        title: Text('WALLPAPERHIVE',
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).primaryColor
            )
        ),
        centerTitle: false,
        titleSpacing: 12,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10),),
        ),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.search_outlined),
              onPressed: () {
                Navigator.push(
                  context, MaterialPageRoute(
                  builder: (BuildContext context) =>
                  const SearchWidget(),
                ),
                );
              }
          ),
          IconButton(
            icon: const Icon(Icons.favorite_outline_rounded),
            iconSize: 27.0,
            onPressed: () {
              Navigator.push(
                context, MaterialPageRoute(
                  builder: (BuildContext context) => FavouriteWidget(favoriteItems: likedImages),
                ),
              );
            }
          ),
          const SizedBox(width: 3)
        ],
      ),
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
              itemCount: snapshot.data!.length,
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
                        borderRadius : const BorderRadius.all(Radius.circular(5)),
                        color : const Color.fromRGBO(230, 230, 230, 1),
                        image : DecorationImage(
                          image: NetworkImage(data.thumbnail),
                          fit: BoxFit.cover,
                        ),
                     ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children:[
                          Padding(
                            padding: const EdgeInsets.only(left: 4, right: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                InkWell(
                                  child: Container(
                                    height : 27,
                                    width : 27,
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      borderRadius : const BorderRadius.all(Radius.circular(18)),
                                      border: Border.all(
                                        color: const Color(0x7EFFFFFF),
                                        width: 1.0,
                                        style: BorderStyle.solid
                                      ),
                                      color: const Color(0x59000000),
                                      image:  DecorationImage(
                                        image: NetworkImage(data.profileImage),
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
                                              child: ProfilePhotosWidget(
                                                userName: data,
                                                name: data,
                                                profile: data,
                                              )
                                          );
                                        }
                                    );
                                  },
                                ),
                                Container(
                                    height : 27,
                                    width : 50,
                                    padding: const EdgeInsets.all(4.2),
                                    decoration: const BoxDecoration(
                                      borderRadius : BorderRadius.all(Radius.circular(18)),
                                      color: Color(0x59FFFFFF),
                                    ),
                                    child: InkWell(
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Icon( liked ?Icons.favorite: Icons.favorite_outline_rounded,
                                              color: liked ? Colors.red.withOpacity(0.8) :Colors.white.withOpacity(1),
                                              size: 20.0
                                          ),
                                          const SizedBox(width: 3),
                                          Text(data.likes,
                                            style: const TextStyle(
                                              fontSize: 15,
                                              color: Color(0xFFFFFFFF),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
                                        ]
                                      ),
                                      onTap: () {
                                        setState(() {
                                          if (liked) {
                                            likedImages.remove(save);
                                          } else {
                                            likedImages.add(save);
                                          }
                                        });
                                      },
                                      onLongPress: () {
                                        Navigator.push(
                                          context, MaterialPageRoute(
                                            builder: (BuildContext context) =>  FavouriteWidget(
                                              favoriteItems: likedImages,
                                            ),
                                          )
                                        );
                                      }
                                    ),
                                ),
                              ]
                            ),
                          ),
                          const SizedBox(height: 5),
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
                      }
                    );
                  },
                  onDoubleTap: () {
                    setState(() {
                      if (liked) {
                        likedImages.remove(save);
                      } else {
                        likedImages.add(save);
                      }
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
}


