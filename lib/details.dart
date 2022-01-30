import 'package:sp/imagedata.dart';
import 'package:flutter/material.dart';

class DetailsWidget extends StatelessWidget{

  final ImageData imageData;

  const DetailsWidget({Key? key, required this.imageData,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height : 25,
              width : 25,
              decoration: BoxDecoration(
                borderRadius : const BorderRadius.all(Radius.circular(5)),
                image : DecorationImage(
                  image: NetworkImage(imageData.profileImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(imageData.name)
          ],
        ),
        titleSpacing: 0,
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 50,
        // actions: <Widget>[
        //   IconButton(
        //     icon: const Icon(Icons.favorite_border),
        //     color: Colors.black,
        //     onPressed: () {
        //       // Navigator.push(
        //       //   context,
        //       //   MaterialPageRoute(builder: (context) => FavouriteWidget(),),
        //       // );
        //     },
        //   ),
        //   IconButton(
        //     icon: const Icon(Icons.shopping_cart_outlined),
        //     color: Colors.black,
        //     onPressed: () {
        //       // Navigator.push(
        //       //   context,
        //       //   MaterialPageRoute(builder: (context) => CartWidget(),),
        //       // );
        //     },
        //   ),
        // ],
      ),
      backgroundColor: Colors.white,
      body: Image.network(
        imageData.image,
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
    );
  }
}