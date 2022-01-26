import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main.dart';

void main() {
  runApp( const CustomDrawer());
}

class CustomDrawer extends StatelessWidget{

  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
            child: Drawer(
                child: ListView(
                  children: [
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                        height: 160,
                        child: UserAccountsDrawerHeader(
                          currentAccountPictureSize: const Size.square(200.0),
                          accountEmail: const Text(''),
                          accountName: Row(
                            children: <Widget>[
                              const SizedBox(
                                width: 80,
                                height: 100,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage('assets/profile.jpg'),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const SizedBox(height: 8),
                                  Text('John Doe'.toUpperCase(),
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontFamily: 'Roboto',
                                      fontSize: 20,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Text(
                                      'jo*****oe@gmail.com'.toLowerCase(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Roboto',
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      )
                                  ),
                                ],
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
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
                    ListTile(
                      leading: const Icon(Icons.home_outlined,size: 22                    ),
                      title: const Text('Home',
                        textAlign: TextAlign.left, style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      onTap: () {
                        // Navigator.push(
                        //   context, MaterialPageRoute(
                        //   builder: (BuildContext context) =>
                        //   const MyStatefulWidget(title: 'LOGO',),
                        // ),
                        // );
                      },
                      minVerticalPadding: 0,
                      minLeadingWidth: 15,
                      horizontalTitleGap: 10,
                    ),
                    ListTile(
                      leading: const Icon(Icons.grid_view_outlined,size: 22),
                      title: const Text('Categories',
                        textAlign: TextAlign.left, style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          letterSpacing: 0,
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
                      leading: const Icon(Icons.favorite_border_outlined,size: 22),
                      title: const Text('Saved',
                        textAlign: TextAlign.left, style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          letterSpacing: 0,
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
                      leading: const Icon(Icons.shopping_cart_outlined,size: 22),
                      title: const Text('Cart',
                        textAlign: TextAlign.left, style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          letterSpacing: 0,
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
                    const ListTile(
                      leading: Icon(Icons.sticky_note_2_outlined,size: 22),
                      title: Text('Terms & Conditions',
                        textAlign: TextAlign.left, style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                        ),),
                      minVerticalPadding: 0,
                      minLeadingWidth: 25,
                      horizontalTitleGap: 10,
                    ),
                    const ListTile(
                      leading: Icon(Icons.phone,size: 22),
                      title: Text('Contact Us',
                        textAlign: TextAlign.left, style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                        ),),
                      minVerticalPadding: 0,
                      minLeadingWidth: 15,
                      horizontalTitleGap: 10,
                    ),
                    const ListTile(
                      leading: Icon(Icons.contact_support_outlined,size: 22),
                      title: Text('About US',
                        textAlign: TextAlign.left, style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                        ),),
                      minVerticalPadding: 0,
                      minLeadingWidth: 15,
                      horizontalTitleGap: 10,
                    ),
                    const Padding(padding: EdgeInsets.only(top: 40.0),),
                    ListTile(
                      title: const Text('App Theme',
                        textAlign: TextAlign.left, style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Icon(MyApp.themeNotifier.value == ThemeMode.light
                          ? Icons.dark_mode
                          : Icons.light_mode,size: 24),
                      onTap: () {
                        MyApp.themeNotifier.value =
                        MyApp.themeNotifier.value == ThemeMode.light
                            ? ThemeMode.dark
                            : ThemeMode.light;
                      },
                    ),
                    ListTile(
                      title: const Text('Language',
                        textAlign: TextAlign.left, style: TextStyle( 
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: const Icon(Icons.language,size: 22),
                      onTap: () {
                        // Navigator.push(
                        //   context, MaterialPageRoute(
                        //   builder: (BuildContext context) =>
                        //   const MyStatefulWidget(title: 'LOGO',),
                        // ),
                        // );
                      },
                    ), 
                  ],
                )
            )
    );
  }
}

