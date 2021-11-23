import 'package:flutter/material.dart';
import 'package:fluttershop/components/badge.dart';
import 'package:fluttershop/components/myBtn.dart';
import 'package:fluttershop/models/cart.dart';
import 'package:fluttershop/models/product.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'cartScreen.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const routeName = '/productDetailsScreen';
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  double rating = 4.5;
  String dropdownValue = 'Xs';
  int qty = 1;
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final productData =
        Provider.of<Products>(context, listen: false).findByID(productId);
    final loadedProduct = productData;
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
        actions: [
          Consumer<Cart>(
            builder: (ctx, cart, ch) => Badge(
              color: Colors.black,
              value: cart.countCartItems.toString(),
              child: IconButton(
                  icon: Icon(Icons.shopping_bag),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => CartScreen()));
                  }),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 330,
                    width: double.infinity,
                    child: Hero(
                      tag: loadedProduct.id,
                      child: Image.network(
                        loadedProduct.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          loadedProduct.title,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        SmoothStarRating(
                          allowHalfRating: true,
                          onRated: (v) {},
                          starCount: 5,
                          rating: rating,
                          isReadOnly: true,
                          size: 20,
                          color: Colors.yellow[800],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          '\$${loadedProduct.price}',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Text(
                                  'Size',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: dropdownValue,
                                      iconSize: 13,
                                      style:
                                          const TextStyle(color: Colors.pink),
                                      onChanged: (String newvalue) {
                                        setState(() {
                                          dropdownValue = newvalue;
                                        });
                                      },
                                      items: <String>['Xs', 'M', 'S'].map(
                                        (value) {
                                          return DropdownMenuItem(
                                            child: Text(value),
                                            value: value,
                                          );
                                        },
                                      ).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                    icon: Icon(
                                      FontAwesomeIcons.plus,
                                      size: 13,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        qty++;
                                      });
                                    }),
                                Container(
                                  child: Text(
                                    qty.toString(),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                ),
                                IconButton(
                                    icon: Icon(
                                      FontAwesomeIcons.minus,
                                      size: 13,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (qty == 1) {
                                          return;
                                        } else {
                                          qty--;
                                        }
                                      });
                                    }),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'About',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          loadedProduct.prodDescription,
                          style: TextStyle(
                              color: Colors.grey[700],
                              height: 1.5,
                              wordSpacing: 1),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          MyBtn(
            icon: Icons.shopping_bag_outlined,
            title: 'Add to cart',
            onpress: () {
              cart.addtoCart(loadedProduct.title, loadedProduct.price, qty,
                  loadedProduct.imageUrl, productId);
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Added item to cart',
                    style: TextStyle(color: Colors.black),
                  ),
                  duration: Duration(seconds: 1),
                  backgroundColor: Colors.white,
                  action: SnackBarAction(
                      label: 'UNDO',
                      onPressed: () {
                        cart.removeSingleItem(loadedProduct.id);
                      }),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
