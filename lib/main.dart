import 'package:ecom/scrrens/cartpage.dart';
import 'package:ecom/scrrens/detalipage.dart';
import 'package:ecom/scrrens/hoempage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const Homepage(),
      'DetailPage': (context) => const DetailPage(),
      'CartPage': (context) => const CartPage(),
    },
  ));
}
