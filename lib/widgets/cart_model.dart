import 'package:flutter/material.dart';

class CartModel {
  // [itemName, itemPrice, imagePath, imageColor]
  final List categoriesList = [
    ["Vegetables", "assets/images/vegetable.png", Colors.orange],
    ["Fruits", "assets/images/fruits.png", Colors.greenAccent],
    ["Meat", "assets/images/meat.png", Color(0xFFF3AE9F)],
    ["Water", "assets/images/water.png", Colors.blue.shade300],
  ];

  final List shopItems = [
    [
      "Carrot",
      "4.00",
      "assets/images/vegetable.png",
      Colors.orange,
      "Sweet Carrots!"
    ],
    [
      "Banana",
      "2.50",
      "assets/images/banana.png",
      Colors.yellow.shade700,
      "Fresh Bananas!"
    ],
    [
      "Avocado",
      "12.20",
      "assets/images/avocado.png",
      Colors.greenAccent,
      "Ready to Enjoy!"
    ],
    [
      "Chicken",
      "25.40",
      "assets/images/meat.png",
      Color(0xFFF3AE9F),
      "Quality Chicken!"
    ],
    [
      "Water",
      "1.00",
      "assets/images/water.png",
      Colors.blue.shade300,
      "Clean, Cool Water!"
    ],
  ];

  List cartItems = [];

  void addItemToCart(int index) {
    cartItems.add(shopItems[index]);
  }

  void removeItemFromCart(int index) {
    if (index >= 0 && index < cartItems.length) {
      cartItems.removeAt(index);
    }
  }

  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i][1]);
    }

    return totalPrice.toStringAsFixed(2);
  }
}
