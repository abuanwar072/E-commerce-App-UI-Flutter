import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Product.dart';
import 'dart:io';
import 'dart:convert';
import 'package:shop_app/screens/home/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  String info=await rootBundle.loadString('assets/info/info.txt');
  runApp(MyApp(ProductList:jsonDecode(info)));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  List<dynamic> ProductList;
  MyApp({this.ProductList});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(ProductList: ProductList,),
    );
  }
}
