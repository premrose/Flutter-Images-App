import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sp/profile.dart';
import 'package:sp/trendingsearch.dart';

import 'customappbar.dart';
import 'customdrawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static final ValueNotifier<ThemeMode> themeNotifier =
  ValueNotifier(ThemeMode.light);


  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'SP',
            theme: ThemeData(
              primaryColor: Colors.white,
              primaryColorBrightness: Brightness.dark,
              brightness: Brightness.light,
              primaryColorLight: Colors.black,
              primaryColorDark: Colors.white,
              canvasColor: Colors.white,
              indicatorColor: Colors.black54,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(
                  color: Color(0xFF242121),
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark ,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedItemColor: const Color(0xFF242121),
                unselectedItemColor: Colors.black.withOpacity(.4),

              ),
            ),
            darkTheme: ThemeData(
              primaryColor: Colors.black,
              primaryColorBrightness: Brightness.light,
              primaryColorLight: Colors.white,
              brightness: Brightness.dark,
              primaryColorDark: Colors.black,
              canvasColor: Colors.black,
              indicatorColor: Colors.white54,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.black,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.black,
                  statusBarIconBrightness: Brightness.light ,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedItemColor: const Color(0xFFFFFFFF),
                unselectedItemColor: Colors.white.withOpacity(.65),
              ),
            ),
            themeMode: currentMode,
            home: const MyHomePage(title: ''),
          );
        }
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int pageIndex = 0;

  GlobalKey bottomNavigationKey = GlobalKey();

  late String _title;

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
        onWillPop: ()async{
      if(pageIndex == 0) {
        return true;
      }
      setState(() {
        pageIndex = 0;
        _title= '';
      });
      return false;
    },
    child: Scaffold(
      appBar: pageIndex == 0 ? CustomAppBar(title: _title,) : null,
      drawer: const CustomDrawer(),
      body: _getnavigation( pageIndex ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 17,
        unselectedFontSize: 16,
        elevation: 0,
        selectedLabelStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.w900),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
            label: '●',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            activeIcon: Icon(Icons.search),
            label: '●',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.whatshot_outlined),
            activeIcon: Icon(Icons.whatshot),
            label: '●',
          ),
        ],
        currentIndex: pageIndex,
        onTap: (index) {
          setState(() {
            pageIndex = index;

          });
        },
      ),

    ),
    );
  }

  _getnavigation( int index ){
    switch(index) {
      case 0:
        return Scaffold(
          body: HomeWidget(title: _title),
        );
      case 1:
        return const Scaffold(
          body: SearchWidget(),
        );
      case 2:
        return const Scaffold(
          body: ProfileWidget(),
        );
    }
  }
}
