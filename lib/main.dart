//
import 'package:flutter/material.dart';

//local
import 'package:fluttershop/screens/home.dart';
import 'package:fluttershop/screens/productDetailsScreen.dart';
import 'package:provider/provider.dart';

import 'models/cart.dart';
import 'models/product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Product()),
        ChangeNotifierProvider(create: (ctx) => Products()),
        ChangeNotifierProvider(create: (ctx) => Cart()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            fontFamily: 'Roboto',
            scaffoldBackgroundColor: Colors.white,
            primaryColor: Colors.white,
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.white, centerTitle: true, elevation: 0),
            textTheme: TextTheme(
                headline1: TextStyle(color: Colors.pink, fontSize: 17))),
        home: Home(),
        routes: {
          ProductDetailsScreen.routeName: (ctx) => ProductDetailsScreen(),
          Home.routeName: (ctx) => Home(),
        },
      ),
    );
  }
}
