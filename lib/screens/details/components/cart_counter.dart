import 'package:flutter/material.dart';

import '../../../constants.dart';

class CartCounter extends StatefulWidget {

  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        buildOutlinedButton(icon:Icons.remove,press:(){
          setState(() {
            if (numOfItems > 1) {
              numOfItems --;
            }
          });
        }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 2),
          child: Text(
            numOfItems.toString().padLeft(2,"0"),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        buildOutlinedButton(icon:Icons.add,press:(){
          setState(() {
            numOfItems ++;
          });
        }),
      ],
    );
  }

  SizedBox buildOutlinedButton({IconData? icon, Function()? press}) {
    return SizedBox(
        width: 40,
        height: 32,
        child: OutlinedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13.0),
              )
            )
          ),
          onPressed: press,
          child: Icon(icon),
        ),
      );
  }
}