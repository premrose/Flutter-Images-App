import 'package:flutter/material.dart';

void main() {
  runApp(const ProfileWidget());
}

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:ListView(
          children: [
            InkWell(
              child: Container(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                height: 120,
                decoration: BoxDecoration(
                  // boxShadow: const [BoxShadow(
                  //   color: Color.fromRGBO(0, 0, 0, 0.15),
                  //   offset: Offset(0, 0),
                  //   blurRadius: 5,
                  // )
                  // ],
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: const AssetImage(
                        'assets/profile.jpg'),
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.2),
                        BlendMode.dstATop),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              onTap: () {
                // Navigator.push(
                //   context, MaterialPageRoute(
                //   builder: (BuildContext context) =>
                //       SigninWidget(),
                // ),
                // );
              },
            ),
            Container(
              transform: Matrix4.translationValues(0.0, -60.0, 0.0),
              child:Column(
                children: <Widget>[
                  Container(
                    height: 100.0,
                    width: 100.0,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      boxShadow : const [BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0,0),
                          blurRadius: 2
                      )],
                      image: const DecorationImage(
                        image: AssetImage('assets/profile.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 8),
                      Text('John Doe'.toUpperCase(),
                        style: const TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 22,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text('jo*****oe@gmail.com'.toLowerCase(),
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          )
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.grid_view_outlined,
              ),
              title: const Text('Categories',
                textAlign: TextAlign.left, style: TextStyle(
                  //,
                  fontFamily: 'Roboto',
                  fontSize: 14,
                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.bold,
                ),
              ),

              onTap: () {
                // Navigator.push(
                //   context, MaterialPageRoute(
                //   builder: (BuildContext context) =>
                //       CategoriesWidget(),
                // ),
                // );
              },
              minVerticalPadding: 0,
              minLeadingWidth: 15,
              horizontalTitleGap: 10,
            ),
            ListTile(
              leading: const Icon(Icons
                  .favorite_border_outlined,
              ),
              title: const Text('Saved',
                textAlign: TextAlign.left, style: TextStyle(
                  //,
                  fontFamily: 'Roboto',
                  fontSize: 14,
                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.bold,
                ),),

              onTap: () {
                // Navigator.push(
                //   context, MaterialPageRoute(
                //   builder: (
                //       BuildContext context) => const FavouriteWidget(),
                // ),
                // );
              },
              minVerticalPadding: 0,
              minLeadingWidth: 15,
              horizontalTitleGap: 10,
            ),
            ListTile(
              leading: const Icon(Icons
                  .shopping_cart_outlined,
              ),
              title: const Text('Cart',
                textAlign: TextAlign.left, style: TextStyle(
                  //,
                  fontFamily: 'Roboto',
                  fontSize: 14,
                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.bold,
                ),),
              trailing: const Icon(Icons.looks_3_outlined),
              onTap: () {
                // Navigator.push(
                //   context, MaterialPageRoute(
                //   builder: (BuildContext context) =>
                //       CartWidget(),
                // ),
                // );
              },
              minVerticalPadding: 0,
              minLeadingWidth: 15,
              horizontalTitleGap: 10,
            ),

            const Padding(padding: EdgeInsets.only(top: 10.0),),
          ],
        )
    );
  }
}