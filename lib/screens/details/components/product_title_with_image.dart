import 'package:flutter/material.dart';
import 'package:shop_app/models/Product.dart';

import '../../../constants.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            product.category,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            product.title,
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(text: "Price\n"),
                TextSpan(
                  text: "\$${product.price}",
                  style: Theme.of(context).textTheme.headline4.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: size.height *0.01,),
          Row(
            children: <Widget>[
              SizedBox(height: size.height*0.1,width: size.width*0.45,),
              SizedBox(width: kDefaultPaddin),
              SizedBox(
                width: size.width*0.33,
                height: size.height*0.34,
                child: Hero(
                  tag: "${product.id}",
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 2,color: Colors.blue ),
                    ),
                    child: Image.memory(
                      product.image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
