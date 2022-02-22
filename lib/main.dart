import 'package:flutter/material.dart';
import 'package:shop/screens/product_detail_screen.dart';
import 'package:shop/screens/products_overview_screen.dart';
import 'package:provider/provider.dart';
import 'providers/products.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      primarySwatch: Colors.purple,
      fontFamily: 'Lato',
    );
    return ChangeNotifierProvider(
        create: (context) => Products(),
      child: MaterialApp(
        title: 'Shop',
        theme: theme.copyWith(
            colorScheme: theme.colorScheme.copyWith(
          secondary: Colors.deepOrange,
        )),
        home: const ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (context) => const ProductDetailScreen(),
        },
      ),
    );
  }
}
