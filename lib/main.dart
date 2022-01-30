import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'customappbar.dart';
import 'customdrawer.dart';
import 'home.dart';

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
              primaryColor: Colors.black,
              primaryColorBrightness: Brightness.dark,
              brightness: Brightness.light,
              primaryColorLight: Colors.black,
              primaryColorDark: Colors.white,
              canvasColor: Colors.white,
              indicatorColor: Colors.black54,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.transparent,
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
              primaryColor: Colors.white,
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
            home: const MyHomePage(title: 'WALLPAPERHIVE'),
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
  initState(){ _title='WALLPAPERHIVE'; }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: pageIndex == 0 ? CustomAppBar(title: _title,) : null,
      endDrawer: const CustomDrawer(),
      body: const HomeWidget(),
    );
  }
}
