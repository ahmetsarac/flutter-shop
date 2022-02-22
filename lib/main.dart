import 'package:flutter/material.dart';
import 'package:shop/screens/products_overview_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(primarySwatch: Colors.purple, fontFamily: 'Lato',);
    return MaterialApp(
      title: 'Shop',
      theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
        secondary: Colors.deepOrange,
      )),
      home: ProductsOverviewScreen(),
    );
  }
}
