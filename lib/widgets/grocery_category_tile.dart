import 'package:flutter/material.dart';

class GroceryCategoryTile extends StatelessWidget {
  final String itemName;
  final String itemPath;
  final Color color;

  const GroceryCategoryTile({
    super.key,
    required this.itemName,
    required this.itemPath,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          //space from right
          margin: EdgeInsets.only(right: 10),
          padding: EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(20)),
          width: 150,
          child: Column(
            children: [
              Image.asset(
                itemPath,
                height: 120,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  itemName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
