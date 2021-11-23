import 'package:flutter/material.dart';
import 'package:fluttershop/models/cart.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  final String id;
  final String productId;
  final String title;
  final String imageUrl;
  final int price;
  final int qty;

  CartItem({
    this.id,
    this.productId,
    this.title,
    this.imageUrl,
    this.price,
    this.qty,
  });

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Dismissible(
      key: Key(widget.productId),
      background: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(3)),
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.delete,
              color: Colors.white,
              size: 25,
            ),
          ),
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        setState(() {
          cart.removeItems(widget.id);
        });
      },
      confirmDismiss: (dir) {
        return showDialog(
            context: context,
            builder: (BuildContext ctx) {
              return AlertDialog(
                title: const Text('Are you sure'),
                content: const Text('Item will be removed'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: Text('No')),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: Text('Yes'))
                ],
              );
            });
      },
      child: Card(
        elevation: 3,
        child: ListTile(
          leading: Container(
            child: Image.network(
              widget.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(widget.title),
          subtitle: Text(
            '\$${widget.price}',
            style: TextStyle(color: Colors.pink),
          ),
          trailing: Text('${widget.qty} x'),
        ),
      ),
    );
  }
}
