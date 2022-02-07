import 'dart:core';
import 'package:flutter/material.dart';

void main() {
  runApp(const FavouriteWidget(favoriteItems: [],));
}

class FavouriteWidget extends StatelessWidget {

  final List<String> favoriteItems;

  const FavouriteWidget({Key? key, required this.favoriteItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    final double itemHeight = size.height / 3;
    final double itemWidth = size.width / 2.1;

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites',style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).primaryColor
        )),
        centerTitle: false,
        titleSpacing: 12,
        elevation: 0,
        toolbarHeight: 55,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.70,
        ),
        itemCount: favoriteItems.length,
        itemBuilder: (BuildContext context, int index) {
        if(favoriteItems.isEmpty){
          return const Center(
              child: Text('Add Favorites')
          );
        }
        else{
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
                    image: NetworkImage(favoriteItems[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
          }
        },
      ),
    );
  }
}

