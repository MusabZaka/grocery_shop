import 'package:flutter/material.dart';
import 'package:grocery_shop/constants.dart';
import 'package:grocery_shop/widgets/cart_model.dart';

import '../widgets/cart_list.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key, required this.cart});
  final CartModel cart;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('My Cart', style: kHeading),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.cart.cartItems.length,
                  itemBuilder: (context, index) {
                    return CartList(
                      itemName: widget.cart.cartItems[index][0],
                      itemPrice: widget.cart.cartItems[index][1],
                      itemPath: widget.cart.cartItems[index][2],
                      color: widget.cart.cartItems[index][3],
                      calories: widget.cart.cartItems[index][4],
                      onPressed: () {
                        setState(() {
                          widget.cart.removeItemFromCart(index);
                        });
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Price',
                            style: TextStyle(
                                fontFamily: 'MochiyPopOne',
                                color: Colors.green.shade100),
                          ),
                          Text(
                            "\$${widget.cart.calculateTotal()}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.white)),
                        child: Row(
                          children: [
                            Text(
                              'Pay Now',
                              style: TextStyle(
                                fontFamily: 'MochiyPopOne',
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
