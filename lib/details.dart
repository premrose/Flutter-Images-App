import 'package:sp/imagedata.dart';
import 'dart:core';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:sp/userprofile.dart';

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
                            colors: [Color(0x00000000), Color(0xD2000000)],
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                      InkWell(
                                        child: Row(
                                          children: [
                                            Container(
                                              height : 40,
                                              width : 40,
                                              decoration: BoxDecoration(
                                                borderRadius : const BorderRadius.all(Radius.circular(25)),
                                                image : DecorationImage(
                                                  image: NetworkImage(imageData.profileImage),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(imageData.name.toUpperCase(),
                                                  style: const TextStyle(
                                                    fontFamily: 'Roboto',
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                  )
                                                ),
                                                const Text('by Unsplash',
                                                  style: TextStyle(
                                                    fontFamily: 'Roboto',
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w300,
                                                  )
                                                ),
                                              ]
                                            )
                                          ]
                                        ),
                                        onTap:(){
                                          showModalBottomSheet(
                                            context: context,
                                            isScrollControlled: true,
                                            builder: (context) {
                                              return FractionallySizedBox(
                                                  heightFactor: 0.96,
                                                  child: ProfilePhotosWidget(
                                                    userName: imageData,
                                                    name: imageData,
                                                    profile: imageData,
                                                  )
                                              );
                                            }
                                          );
                                        }
                                      ),
                                    ]
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10, bottom: 5,),
                                  child: Row(
                                    children: [
                                      Container(
                                        height : 50,
                                        width : 40,
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
                                      const SizedBox(width: 6),
                                      Container(
                                        height : 50,
                                        width : 40,
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
                                              const Text('1793',
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
                                    ]
                                  )
                                )
                                // Padding(
                                //   padding: const EdgeInsets.only(right: 10, bottom: 5,),
                                //   child: Column(
                                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                //       children: [
                                //         Container(
                                //           height : 55,
                                //           width : 37,
                                //           decoration: const BoxDecoration(
                                //             borderRadius : BorderRadius.all(Radius.circular(8)),
                                //             color: Color(0x46FFFFFF),
                                //           ),
                                //           child: Column(
                                //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                //               crossAxisAlignment: CrossAxisAlignment.center,
                                //               children: [
                                //                 const SizedBox(height: 2),
                                //                 InkWell(
                                //                     child: const Icon(Icons.favorite, size: 25,color: Color(0xD8FFFFFF),),
                                //                     onTap: () {}
                                //                 ),
                                //                 const SizedBox(height: 1),
                                //                 Text(imageData.likes,
                                //                     style: const TextStyle(
                                //                       fontFamily: 'Roboto',
                                //                       fontSize: 12,
                                //                       color: Color(0xD8FFFFFF),
                                //                       fontWeight: FontWeight.w400,
                                //                     )
                                //                 ),
                                //                 const SizedBox(height: 2),
                                //               ]
                                //           ),
                                //         ),
                                //         const SizedBox(height: 10),
                                //         Container(
                                //           height : 55,
                                //           width : 37,
                                //           decoration: const BoxDecoration(
                                //             borderRadius : BorderRadius.all(Radius.circular(8)),
                                //             color: Color(0x46FFFFFF),
                                //           ),
                                //           child: Column(
                                //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                //               crossAxisAlignment: CrossAxisAlignment.center,
                                //               children: [
                                //                 const SizedBox(height: 2),
                                //                 InkWell(
                                //                     child: const Icon(Icons.file_download_outlined, size: 28,color: Color(0xD8FFFFFF),),
                                //                     onTap: () {}
                                //                 ),
                                //                 const SizedBox(height: 1),
                                //                 Text(imageData.downloads,
                                //                     style: const TextStyle(
                                //                       fontFamily: 'Roboto',
                                //                       fontSize: 10,
                                //                       color: Color(0xD8FFFFFF),
                                //                       fontWeight: FontWeight.w400,
                                //                     )
                                //                 ),
                                //                 const SizedBox(height: 2),
                                //               ]
                                //           ),
                                //         ),
                                //         const SizedBox(height: 10),
                                //         Container(
                                //           height : 35,
                                //           width : 37,
                                //           decoration: const BoxDecoration(
                                //             borderRadius : BorderRadius.all(Radius.circular(8)),
                                //             color: Color(0x46FFFFFF),
                                //           ),
                                //           child: Column(
                                //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                //               crossAxisAlignment: CrossAxisAlignment.center,
                                //               children: [
                                //                 const SizedBox(height: 2),
                                //                 InkWell(
                                //                     child: const Icon(Icons.info_outlined, size: 23, color: Color(0xD8FFFFFF),),
                                //                     onTap: () {}
                                //                 ),
                                //                 const SizedBox(height: 2),
                                //               ]
                                //           ),
                                //         ),
                                //         const SizedBox(height: 10),
                                //         Container(
                                //           height : 35,
                                //           width : 37,
                                //           decoration: const BoxDecoration(
                                //             borderRadius : BorderRadius.all(Radius.circular(8)),
                                //             color: Color(0x46FFFFFF),
                                //           ),
                                //           child: Column(
                                //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                //               crossAxisAlignment: CrossAxisAlignment.center,
                                //               children: [
                                //                 const SizedBox(height: 2),
                                //                 InkWell(
                                //                     child: const Icon(Icons.analytics_outlined, size: 25, color: Color(0xD8FFFFFF),),
                                //                     onTap: () {}
                                //                 ),
                                //                 const SizedBox(height: 2),
                                //               ]
                                //           ),
                                //         ),
                                //         const SizedBox(height: 5),
                                //       ]
                                //   )
                                // )
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
              left: 20.0,
              top: 35.0,
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    radius: 18.0,
                    backgroundColor: Theme.of(context).primaryColorLight.withOpacity(0.5),
                    child: Icon(Icons.arrow_back_ios_rounded,
                      color: Theme.of(context).primaryColorDark,
                      size: 22
                    ),
                  ),
                ),
              ),
            ),
          ]
      ),

    );
  }

}
