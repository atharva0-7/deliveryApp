import 'package:flutter/material.dart';
import 'package:food_delivery/data/source/remote/get_all_products.dart';
import 'package:food_delivery/providers/add_to_cart_provider.dart';
import 'package:food_delivery/widget/circular_progress.dart';
import 'package:provider/provider.dart';
import 'Pages/main_page.dart';

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getAllProducts(context),
        builder: ((context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ChangeNotifierProvider(
                create: (context) => AddToCart(),
                builder: (context, child) {
                  return MaterialApp(
                      darkTheme: ThemeData.dark().copyWith(),
                      debugShowCheckedModeBanner: false,
                      title: "Food Delivery",
                      home: MainPage(
                        snapshot: snapshot,
                      ));
                });
          } else {
            return const MaterialApp(home: CircularProgressIndicatorWidget());
          }
        }));
  }
}
