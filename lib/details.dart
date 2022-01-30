import 'package:sp/imagedata.dart';
import 'package:flutter/material.dart';

class DetailsWidget extends StatelessWidget{

  final ImageData imageData;

  const DetailsWidget({Key? key, required this.imageData,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    final double itemHeight = size.height;
    final double itemWidth = size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50,
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: itemHeight,
        width: itemWidth,
        decoration: BoxDecoration(
          boxShadow : const [BoxShadow(
              color: Color.fromRGBO(222, 222, 222, 1.0),
              offset: Offset(0,0),
          )],
          image: DecorationImage(
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
                    colors: [Color(0x0), Color(0xAB000000)],
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
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                  Text(imageData.name,
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Theme.of(context).primaryColorDark
                                      )
                                  )
                                ]
                              ),
                              const SizedBox(height: 5),
                              Text(imageData.name,
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context).primaryColorDark
                                  )
                              )
                            ]
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.favorite, size: 28,),
                              color: Theme.of(context).primaryColorDark,
                              onPressed: () {}
                            ),
                            const SizedBox(height: 5),
                            IconButton(
                              icon: const Icon(Icons.favorite, size: 28,),
                              color: Theme.of(context).primaryColorDark,
                              onPressed: () {}
                            ),
                            const SizedBox(height: 5),
                            IconButton(
                              icon: const Icon(Icons.favorite, size: 28,),
                              color: Theme.of(context).primaryColorDark,
                              onPressed: () {}
                            ),
                          ]
                        )
                      ]
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ]
          )
        )

    );
  }
}