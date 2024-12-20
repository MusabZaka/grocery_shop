import 'package:flutter/material.dart';
import 'package:grocery_shop/pages/cart_page.dart';
import 'package:grocery_shop/widgets/grocery_category_tile.dart';
import 'package:grocery_shop/widgets/grocery_list_tile.dart';

import '../constants.dart';
import '../widgets/cart_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Object of cartModel
  CartModel cart = CartModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, top: 30, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Good Morning,', style: kSubHeading),
              SizedBox(height: 10),
              Text('Let\'s order fresh items for you', style: kHeading),
              SizedBox(height: 40),
              Text('Categories', style: kSubHeading),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cart.categoriesList.length,
                  itemBuilder: (context, index) {
                    return GroceryCategoryTile(
                      itemName: cart.categoriesList[index][0],
                      itemPath: cart.categoriesList[index][1],
                      color: cart.categoriesList[index][2],
                    );
                  },
                ),
              ),
              Text('Fresh Items', style: kSubHeading),
              SizedBox(height: 10),
              Expanded(
                flex: 2,
                child: ListView.builder(
                    itemCount: cart.shopItems.length,
                    itemBuilder: (context, index) {
                      return GroceryListTile(
                        itemName: cart.shopItems[index][0],
                        itemPrice: cart.shopItems[index][1],
                        itemPath: cart.shopItems[index][2],
                        color: cart.shopItems[index][3],
                        calories: cart.shopItems[index][4],
                        onPressed: () {
                          setState(() {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.black,
                                duration: Duration(seconds: 1),
                                content: Text(
                                  "${cart.shopItems[index][0]} added to cart",
                                  style: kSubHeading,
                                ),
                              ),
                            );
                            cart.addItemToCart(index);
                          });
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CartPage(cart: cart)));
        },
        child: Icon(
          Icons.shopping_bag_outlined,
          color: Colors.black,
        ),
      ),
    );
  }
}
