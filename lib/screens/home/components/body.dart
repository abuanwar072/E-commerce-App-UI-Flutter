import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'dart:io';
import 'categorries.dart';
import 'item_card.dart';

class Body extends StatefulWidget {

  List<dynamic> ProductList;
  Body({this.ProductList});
  @override
  _BodyState createState() => _BodyState(ProductList: ProductList);
}

class _BodyState extends State<Body> {
  List<Product> Plist=[];
  List<String> Clist=[];
  Map CatProdDict=Map();
  List<dynamic> ProductList;
  String SelectedCategory;
  _BodyState({this.ProductList});
  @override
  void initState() {
    for(int i=0;i<ProductList.length;++i){
      Plist.add(Product(
          id: int.parse(ProductList[i]['id']),
          title: ProductList[i]['title'],
          price: int.parse(ProductList[i]['price']),
          //size: int.parse(ProductList[i]['size']),
          description: ProductList[i]['description'],
          image: base64Decode(ProductList[i]['img_string']),
          category: ProductList[i]['category'],
          color: Color(0xFF3D82AE)),);
    }
    Plist.forEach((element) {
      Clist.add(element.category);
    });
    Clist=Clist.toSet().toList();
    Clist.forEach((element) {
      CatProdDict[element]=[];
    });
    Plist.forEach((element) {
      CatProdDict[element.category].add(element);
    });
    print(CatProdDict);
    SelectedCategory=Plist[0].category;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Text(
            "Women",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Categories(
            Clist: Clist,
            onCategoryChange: (value){
            setState(() {
              SelectedCategory=value;
            });
        }),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
                itemCount: CatProdDict[SelectedCategory].length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: kDefaultPaddin,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => ItemCard(
                  product: CatProdDict[SelectedCategory][index],
                  press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          product: CatProdDict[SelectedCategory][index],
                        ),
                      )),
                )),
          ),
        ),
      ],
    );
  }
}

