import 'package:flutter/material.dart';
import 'package:fluttershop/components/cartitem.dart';
import 'package:fluttershop/components/myBtn.dart';
import 'package:fluttershop/models/cart.dart';
import 'package:fluttershop/screens/home.dart';
import 'package:fluttershop/screens/lastScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context);
    final cartItems = cartData.cartItems;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: GoogleFonts.dmSerifDisplay(fontSize: 30),
        ),
      ),
      body: cartItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Cart is empty',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    child: MyBtn(
                      icon: Icons.shopping_bag_outlined,
                      onpress: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, 'home', (route) => false);
                      },
                      title: 'Go back to shop',
                    ),
                  )
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (ctx, i) => CartItem(
                      id: cartItems.values.toList()[i].id,
                      productId: cartItems.keys.toList()[i],
                      imageUrl: cartItems.values.toList()[i].imageUrl,
                      price: cartItems.values.toList()[i].price,
                      qty: cartItems.values.toList()[i].qty,
                      title: cartItems.values.toList()[i].title,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: Column(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'SubTotal',
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 15),
                              ),
                              Text(
                                '\$${cartData.totalAmount}',
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Divider(),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Delivery',
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 15),
                              ),
                              Text(
                                '\$13',
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Divider(),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total (Incl.Tax)',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              Text(
                                '\$${cartData.totalAmount}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: MyBtn(
                    icon: Icons.check,
                    onpress: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => LastScreen()));
                    },
                    title: 'CheckOut',
                  ),
                )
              ],
            ),
    );
  }
}
