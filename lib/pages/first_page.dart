import 'package:flutter/material.dart';
import 'package:grocery_shop/constants.dart';

import 'home_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Image(
              image: AssetImage('assets/images/farmer.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 10, bottom: 30),
            child: Text(
              textAlign: TextAlign.center,
              'We deliver\n groceries at your\n doorstep',
              style: kHeading,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 50),
            child: Text(
              maxLines: 3,
              textAlign: TextAlign.center,
              'Groceer give you fresh vegetables and fruits, Order fresh items from groceer',
              style: kSubHeading,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 18)),
            child: Text(
              'Get Started',
              style: TextStyle(fontFamily: 'MochiyPopOne'),
            ),
          ),
        ],
      ),
    );
  }
}
