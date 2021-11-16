import 'package:flutter/material.dart';
import 'package:shop_app/models/Product.dart';

import '../../../constants.dart';

class ProductTitleWithImage extends StatelessWidget {

  final Product? product;

  const ProductTitleWithImage({Key? key, this.product}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "aaaaaaaaaaa",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            product!.title.toString(),
            style: Theme.of(context)
                .textTheme
                .headline4?.copyWith(color: Colors.white,fontWeight: FontWeight.bold),
          ),
          SizedBox(height: kDefaultPaddin,),
          Row(
            children: <Widget>[
              //  RichText:TextSpanを羅列して文字を装飾したりタップ処理ができる
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "Price\n"),
                    TextSpan(
                      text: "\$${product!.price}",
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ]
                ),
              ),
              SizedBox(width: kDefaultPaddin,),
              Expanded(
                child: Hero(
                  tag: "${product!.id}",
                  child: Image.asset(product!.image.toString(),fit: BoxFit.fill,)
                ),
              )
            ],
          )
        ]
      ),
    );
  }
}