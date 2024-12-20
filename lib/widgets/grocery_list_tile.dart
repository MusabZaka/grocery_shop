import 'package:flutter/material.dart';
import 'package:grocery_shop/constants.dart';

class GroceryListTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String calories;
  final String itemPath;
  final void Function()? onPressed;
  final Color color;

  const GroceryListTile({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.itemPath,
    required this.onPressed,
    required this.color,
    required this.calories,
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
        title: Text(
          itemName,
          style: kItemsHeading,
        ),
        subtitle: Text(
          calories,
          style: kItemsSubHeading,
        ),
        leading: CircleAvatar(
          radius: 30,
          // maxRadius: 80,
          backgroundColor: color,
          child: Image(
            image: AssetImage(itemPath),
            height: 100,
          ),
        ),
        trailing: GestureDetector(
          onTap: onPressed,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(8)),
            child: Text(
              '\$$itemPrice',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
