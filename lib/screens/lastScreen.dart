import 'package:flutter/material.dart';
import 'package:fluttershop/components/myBtn.dart';
import 'package:fluttershop/models/cart.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LastScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Lottie.network(
                'https://assets3.lottiefiles.com/packages/lf20_totrpclr.json',
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Text(
                      'Thank you for shopping',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        'Dear customer thanks for your order! We’ll let you know when it’s on its way.And keep ready given amount on delivery day. ',
                        style: TextStyle(
                            fontSize: 17, letterSpacing: 0.5, height: 1.4),
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      '\$${cart.totalAmount}',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: MyBtn(
                icon: Icons.shopping_bag_outlined,
                title: 'Coutinue shopping',
                onpress: () {
                  cart.clearCart();
                  Navigator.pushNamedAndRemoveUntil(
                      context, 'home', (route) => false);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
