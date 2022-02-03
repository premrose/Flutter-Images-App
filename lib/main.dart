import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
            ),
            themeMode: currentMode,
            home: const HomeWidget(),
          );
        }
    );
  }
}
