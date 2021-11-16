
import 'package:flutter/material.dart';
import 'package:shop_app/models/Product.dart';

import '../../../constants.dart';

class ItemCard extends StatelessWidget {

  final Product? product;
  final Function()? press;  // or final VoidCallback? press;

  const ItemCard({
    Key? key,
    this.product,
    this.press
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if (product == null) {
      return Container();
    }

    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //  隙間を埋める(https://zenn.dev/captain_blue/articles/try-to-use-the-expanded-widget)
          Expanded (
            child: Container(
              padding: EdgeInsets.all(kDefaultPaddin),
              decoration: BoxDecoration(
                color: product!.color,
                borderRadius: BorderRadius.circular(16),
              ),
              //  Hero:振ったtagのIdをもとに遷移アニメーション
              //  遷移先(details_screenのBody)はStackしとく
              child: Hero(
                tag: "${product!.id}",
                child: Image.asset(product!.image.toString())
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(product!.title.toString(),style: TextStyle(color: kTextLightColor),),
          ),
          Text('\$${product!.price}',style: TextStyle(fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}