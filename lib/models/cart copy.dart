import 'package:flutter/material.dart';

class CartModel {
  final String id;
  final String title;
  final int price;
  final String imageUrl;
  final int qty;

  CartModel({this.id, this.title, this.price, this.imageUrl, this.qty});
}

class Cart with ChangeNotifier {
  Map<String, CartModel> cartItems = {};

  int get countCartItems {
    return cartItems.length;
  }

  double get totalAmount {
    var total = 0.0;
    cartItems.forEach((key, cartItem) {
      total += cartItem.price * cartItem.qty;
    });
    return total;
  }

  void addtoCart(String cartTitle, int cartPrice, int cartQty, String cartImage,
      String productId) {
    CartModel(
        id: productId,
        imageUrl: cartImage,
        price: cartPrice,
        qty: cartQty,
        title: cartTitle);

    if (cartItems.containsKey(productId)) {
      cartItems.update(
          productId,
          (existingCartItem) => CartModel(
                id: existingCartItem.id,
                imageUrl: existingCartItem.imageUrl,
                price: existingCartItem.price,
                qty: existingCartItem.qty + 1,
                title: existingCartItem.title,
              ));
    } else {
      cartItems.putIfAbsent(
          productId,
          () => CartModel(
              id: productId,
              imageUrl: cartImage,
              price: cartPrice,
              qty: cartQty,
              title: cartTitle));
    }
    notifyListeners();
  }

  removeSingleItem(String productId) {
    if (!cartItems.containsKey(productId)) {
      return;
    }
    if (cartItems[productId].qty > 1) {
      cartItems.update(
          productId,
          (existingCartItem) => CartModel(
              id: existingCartItem.id,
              imageUrl: existingCartItem.imageUrl,
              price: existingCartItem.price,
              qty: existingCartItem.qty - 1,
              title: existingCartItem.title));
    } else {
      cartItems.remove(productId);
    }
    notifyListeners();
  }

  removeItems(String productId) {
    cartItems.remove(productId);
    notifyListeners();
  }

  clearCart() {
    cartItems = {};
    notifyListeners();
  }
}
