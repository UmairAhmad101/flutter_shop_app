import 'package:flutter/material.dart';
import 'package:fluttershop/models/product.dart';
import 'package:fluttershop/screens/productDetailsScreen.dart';
import 'package:provider/provider.dart';

class ProductTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailsScreen.routeName,
            arguments: product.id);
      },
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Hero(
                  tag: product.id,
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            product.title,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            product.subTitle,
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            height: 3,
          ),
          Text('\$${product.price}',
              style: Theme.of(context).textTheme.headline1),
        ],
      ),
    );
  }
}
