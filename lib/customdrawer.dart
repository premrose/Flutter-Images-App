import 'package:flutter/material.dart';
import 'favorites.dart';
import 'home.dart';
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
            child: Column(
              children: [
                InkWell(
                  child: UserAccountsDrawerHeader(
                      currentAccountPictureSize: const Size.square(200.0),
                      accountEmail: const Text(''),
                      accountName: Row(
                        children: <Widget>[
                          const SizedBox(
                            width: 80,
                            height: 100,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage('https://images.unsplash.com/photo-1552058544-f2b08422138a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGZhY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60'),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('John Doe'.toUpperCase(),
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 22,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                  'jo*****oe@gmail.com'.toLowerCase(),
                                  style: const TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  )
                              ),
                            ],
                          ),
                        ],
                      ),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  trailing: const Icon(Icons.home_outlined,size: 22),
                  title: const Text('Home',
                    textAlign: TextAlign.left, style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      letterSpacing: 0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  onTap: () {
                    Navigator.push(
                      context, MaterialPageRoute(
                        builder: (BuildContext context) =>
                        const HomeWidget(),
                      ),
                    );
                  },
                  minVerticalPadding: 0,
                  minLeadingWidth: 15,
                  horizontalTitleGap: 10,
                ),
                ListTile(
                  trailing: const Icon(Icons.favorite_border_outlined,size: 22),
                  title: const Text('Saved',
                    textAlign: TextAlign.left, style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      letterSpacing: 0,
                      fontWeight: FontWeight.bold,
                    ),),
                  onTap: () {
                    Navigator.push(
                      context, MaterialPageRoute(
                        builder: (
                          BuildContext context) => const FavouriteWidget(favoriteItems: [],),
                      ),
                    );
                  },
                  minVerticalPadding: 0,
                  minLeadingWidth: 15,
                  horizontalTitleGap: 10,
                ),
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
                Expanded(child: Container()),
                ListTile(
                  title: const Text('Logout',
                    textAlign: TextAlign.left, style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      letterSpacing: 0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: const Icon(Icons.logout_outlined,size: 22),
                  onTap: () {
                    // Navigator.push(
                    //   context, MaterialPageRoute(
                    //   builder: (BuildContext context) =>
                    //   const MyStatefulWidget(title: 'LOGO',),
                    // ),
                    // );
                  },
                ),
                const Padding(padding: EdgeInsets.only(bottom: 15.0),),
              ],
            )
        )
    );
  }
}

