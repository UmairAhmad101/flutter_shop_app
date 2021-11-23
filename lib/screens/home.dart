import 'package:flutter/material.dart';
import 'package:fluttershop/components/badge.dart';
import 'package:fluttershop/models/cart.dart';
import 'package:fluttershop/models/product.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

//locals
import '../components/productTile.dart';
import 'cartScreen.dart';

class Home extends StatelessWidget {
  static const routeName = 'home';
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    final productsItem = products.productsItem;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Hits',
          style: GoogleFonts.dmSerifDisplay(fontSize: 30),
        ),
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
      body: Container(
        child: GridView.builder(
            itemCount: productsItem.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.6,
              mainAxisSpacing: 5,
              crossAxisCount: 2,
            ),
            itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                value: productsItem[i], child: ProductTile())),
      ),
    );
  }
}
