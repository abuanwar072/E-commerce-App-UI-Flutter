import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme.of(context).copyWith(
          backgroundColor: Color(0xFFFEFEFE)
        )
      ),
      highContrastTheme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme.of(context).copyWith(
          backgroundColor: Color(0xFF303030)
        ),
        backgroundColor: Color(0xFF303030),
        colorScheme: ColorScheme.dark(),
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kHighContrastTextLightColor),
        primaryColorDark: Color(0xFF000000),
      ),
      home: HomeScreen(),
    );
  }
}
