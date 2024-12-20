import 'package:flutter/material.dart';

import '../constants.dart';

class CartList extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String calories;
  final void Function()? onPressed;

  final String itemPath;
  final Color color;

  const CartList({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.itemPath,
    required this.color,
    required this.calories,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      //space from outside right and bottom
      margin: EdgeInsets.only(bottom: 10, right: 20),
      //space from inside
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade50,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          // maxRadius: 80,
          backgroundColor: color,
          child: Image(
            image: AssetImage(itemPath),
            height: 100,
          ),
        ),
        title: Text(
          itemName,
          style: kItemsHeading,
        ),
        subtitle: Text(
          '\$$itemPrice',
          style: kItemsSubHeading,
        ),
        trailing: GestureDetector(
          onTap: onPressed,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(8)),
            child: Icon(
              Icons.delete_outline,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
