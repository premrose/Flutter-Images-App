import 'package:sp/imagedata.dart';
import 'dart:core';
import 'package:flutter/material.dart';
import 'dart:ui';

class DetailsWidget extends StatelessWidget{

  final ImageData imageData;

  const DetailsWidget({Key? key, required this.imageData}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    final double itemHeight = size.height;
    final double itemWidth = size.width;

    return Scaffold(
      body: Stack(
          children: [
            Container(
              height: itemHeight,
              width: itemWidth,
              decoration: BoxDecoration(
                image : DecorationImage(
                  image: NetworkImage(imageData.image),
                  fit: BoxFit.cover,
                ),
              ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0x00000000), Color(0xAB000000)],
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15, bottom: 10,),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height : 35,
                                            width : 35,
                                            decoration: BoxDecoration(
                                              borderRadius : const BorderRadius.all(Radius.circular(25)),
                                              image : DecorationImage(
                                                image: NetworkImage(imageData.profileImage),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          Text(imageData.name.toUpperCase(),
                                            style: const TextStyle(
                                              fontFamily: 'Roboto',
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            )
                                          ),
                                        ]
                                      ),
                                      const SizedBox(height: 4),
                                      SizedBox(
                                        width: 200,
                                        child:Text(imageData.description,
                                          style: const TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            overflow: TextOverflow.fade,
                                          )
                                        )
                                      )
                                    ]
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10, bottom: 5,),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          height : 55,
                                          width : 37,
                                          decoration: const BoxDecoration(
                                            borderRadius : BorderRadius.all(Radius.circular(8)),
                                            color: Color(0x46FFFFFF),
                                          ),
                                          child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                const SizedBox(height: 2),
                                                InkWell(
                                                    child: const Icon(Icons.favorite, size: 25,color: Color(0xD8FFFFFF),),
                                                    onTap: () {}
                                                ),
                                                const SizedBox(height: 1),
                                                Text(imageData.likes,
                                                    style: const TextStyle(
                                                      fontFamily: 'Roboto',
                                                      fontSize: 12,
                                                      color: Color(0xD8FFFFFF),
                                                      fontWeight: FontWeight.w400,
                                                    )
                                                ),
                                                const SizedBox(height: 2),
                                              ]
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Container(
                                          height : 55,
                                          width : 37,
                                          decoration: const BoxDecoration(
                                            borderRadius : BorderRadius.all(Radius.circular(8)),
                                            color: Color(0x46FFFFFF),
                                          ),
                                          child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                const SizedBox(height: 2),
                                                InkWell(
                                                    child: const Icon(Icons.file_download_outlined, size: 28,color: Color(0xD8FFFFFF),),
                                                    onTap: () {}
                                                ),
                                                const SizedBox(height: 1),
                                                const Text('20346',
                                                    style: TextStyle(
                                                      fontFamily: 'Roboto',
                                                      fontSize: 10,
                                                      color: Color(0xD8FFFFFF),
                                                      fontWeight: FontWeight.w400,
                                                    )
                                                ),
                                                const SizedBox(height: 2),
                                              ]
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Container(
                                          height : 35,
                                          width : 37,
                                          decoration: const BoxDecoration(
                                            borderRadius : BorderRadius.all(Radius.circular(8)),
                                            color: Color(0x46FFFFFF),
                                          ),
                                          child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                const SizedBox(height: 2),
                                                InkWell(
                                                    child: const Icon(Icons.info_outlined, size: 23, color: Color(0xD8FFFFFF),),
                                                    onTap: () {}
                                                ),
                                                const SizedBox(height: 2),
                                              ]
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Container(
                                          height : 35,
                                          width : 37,
                                          decoration: const BoxDecoration(
                                            borderRadius : BorderRadius.all(Radius.circular(8)),
                                            color: Color(0x46FFFFFF),
                                          ),
                                          child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                const SizedBox(height: 2),
                                                InkWell(
                                                    child: const Icon(Icons.analytics_outlined, size: 25, color: Color(0xD8FFFFFF),),
                                                    onTap: () {}
                                                ),
                                                const SizedBox(height: 2),
                                              ]
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                      ]
                                  )
                                )
                              ]
                            ),
                            const SizedBox(height: 18),
                          ],
                        ),
                      ),
                    ]
                  )
            ),
            Positioned(
              right: 15.0,
              top: 20.0,
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: const Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    radius: 14.0,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.close, color: Colors.red),
                  ),
                ),
              ),
            ),
          ]
      ),

    );
  }

}
