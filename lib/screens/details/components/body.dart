import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Product.dart';

import 'add_to_cart.dart';
import 'color_and_size.dart';
import 'counter_with_fav_btn.dart';
import 'description.dart';
import 'product_title_with_image.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: size.height * 0.3),
                padding: EdgeInsets.only(
                  top: size.height * 0.12,
                  left: kDefaultPaddin,
                  right: kDefaultPaddin,
                ),
                // height: 500,
                decoration: BoxDecoration(
                  color: MediaQuery.of(context).highContrast ? Theme.of(context).primaryColorDark : Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Price\n",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: MediaQuery.of(context).highContrast ? kHighContrastTextLightColor : kTextColor
                                ),
                          ),
                          TextSpan(
                            text: "\$${product.price}",
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: MediaQuery.of(context).highContrast ? kHighContrastTextLightColor : kTextColor,
                                ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: kDefaultPaddin / 2),
                    ColorAndSize(product: product),
                    SizedBox(height: kDefaultPaddin / 2),
                    Description(product: product),
                    SizedBox(height: kDefaultPaddin / 2),
                    CounterWithFavBtn(),
                    SizedBox(height: kDefaultPaddin / 2),
                    AddToCart(product: product)
                  ],
                ),
              ),
              ProductTitleWithImage(product: product)
            ],
          )
        ],
      ),
    );
  }
}
