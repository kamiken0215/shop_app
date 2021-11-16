import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/details/components/color_and_size.dart';
import 'package:shop_app/screens/details/components/description.dart';
import 'package:shop_app/screens/details/components/product_title_with_image.dart';

import 'add_to_card.dart';
import 'counter_with_fav_button.dart';

class Body extends StatelessWidget {

  final Product? product;

  const Body({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  デバイスの画面サイズを取得
    Size size = MediaQuery.of(context).size;
    //  SingleChildScrollView:コンテンツが端末の高さを越えたらスクロールしてくれる
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            //  Stack:Widgetを重ねる
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.13,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin,
                  ),
                  height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    )
                  ),
                  child: Column(
                    children: <Widget>[
                      ColorAndSize(product: product),
                      SizedBox(height: kDefaultPaddin / 2,),
                      Description(product: product),
                      SizedBox(height: kDefaultPaddin / 2,),
                      CounterWithFavButton(),
                      SizedBox(height: kDefaultPaddin / 2,),
                      AddToCart(product: product)
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product,)
              ],
            )
          )
        ],
      ),
    );
  }
}