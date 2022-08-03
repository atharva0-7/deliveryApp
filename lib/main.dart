
import 'package:flutter/material.dart';
import 'package:food_delivery/providers/add_to_cart_provider.dart';
import 'package:provider/provider.dart';
import 'Pages/main_page.dart';

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return ChangeNotifierProvider(
    create:(_)=>AddToCart(),builder: (context, child) => MaterialApp(
            darkTheme: ThemeData.dark().copyWith(),
              debugShowCheckedModeBanner: false,
              title: "Food Delivery",
              home: MainPage(),
            ),
    
   );
  }
}
