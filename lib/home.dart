import 'dart:convert';
import 'dart:core';
import 'package:easyShop/FavouriteWidget.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:http/http.dart' as http;

void main() {
  runApp( const ProductsListWidget() );
}

class ProductsListWidget extends StatelessWidget {
  const ProductsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apple Products'.toUpperCase(),style: const TextStyle(
          fontSize: 17,
          fontFamily: "Roboto",
        ),),
        titleSpacing: 0,
        // centerTitle: true,
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0,
        // toolbarHeight: 50,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.favorite_border),
            color: Colors.black,
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => FavouriteWidget(),),
              // );
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            color: Colors.black,
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => CartWidget(),),
              // );
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: MyStatefullWidget(),
    );
  }
}

class MyStatefullWidget extends StatefulWidget  {

  @override
  _MyStatefullWidgetState createState() => _MyStatefullWidgetState();
}

class _MyStatefullWidgetState extends State<MyStatefullWidget> {

  dynamic _parsedResponse = '';

  dynamic _photos = [];

  final GlobalKey _scaffold = GlobalKey();

  bool liked = false;
  _pressed() {
    liked = !liked;
  }

  Future _fetchPhotos() async {
        http.Response response = await http.get(
            Uri.parse('https://api.unsplash.com/photos/?client_id=7P_EvCeZLcR3ZeY7lOD8T1sGjXty_wasCviRfcXINYY&per_page=30&page='));
        _parsedResponse = json.decode(response.body);
        return _parsedResponse;
  }

  Widget _renderPhotos() => ListView(
    children: <Widget>[
      ..._photos,
    ],
  );

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    final double itemHeight = size.height / 3;
    final double itemWidth = size.width / 2.1;

    return Scaffold(
      key: _scaffold,
      body: _photos.isEmpty
          ?FutureBuilder(
        future: _fetchPhotos(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
            return GridView.builder(
              itemCount: snapshot.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                childAspectRatio: 0.70,
              ),
              itemBuilder: (context, index) {
                if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
                  _photos = snapshot.data.toList().map(
                        (photo) => InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                              MaterialPageRoute(builder: (context) => DetailsPage(
                                arguments: {
                                  'id': photo['id'],
                                  'urls_raw': photo['urls']['raw'],
                                  'urls_regular': photo['urls']['regular'],
                                  'user': photo['user'],
                                  'likes': photo['likes'],
                                  'color': photo['color'],
                                  'width': photo['width'],
                                  'height': photo['height'],
                                  'created_at': photo['created_at'],
                                  'links_html': photo['links']['html'],
                                }
                            ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.all(8),
                        child: Hero(
                          tag: photo['id'],
                          child: Image.network(photo['urls']['small']),
                        ),
                      ),
                    ),
                  );
                  return _renderPhotos();
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

        }
      );
        }
      ): _renderPhotos(),
    );
  }
}

