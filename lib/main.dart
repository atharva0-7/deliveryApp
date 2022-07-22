import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Pages/main_page.dart';

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoApp(
            debugShowCheckedModeBanner: false,
            title: "Food Delivery",
            home: MainPage(),
          )
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Food Delivery",
            home: MainPage(),
          );
  }
}
