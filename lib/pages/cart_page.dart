import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CartPage extends StatelessWidget {
  int count;
  CartPage(this.count);

  @override
  Widget build(BuildContext context) {
    final bodyWidget = Center(
        child: Text(
      "$count item selected",
      style: const TextStyle(fontSize: 30),
    ));
    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: const CupertinoNavigationBar(
                middle: Text("Cart"), automaticallyImplyLeading: true),
            child: bodyWidget)
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.grey.shade400,
              title: const Text("Cart",
                  style: TextStyle(
                    color: Colors.black,
                  )),
              centerTitle: false,
            ),
            body: bodyWidget);
  }
}
