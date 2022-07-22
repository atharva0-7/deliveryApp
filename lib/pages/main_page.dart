import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery/models/item_information.dart';
import 'package:food_delivery/pages/cart_page.dart';
import 'package:food_delivery/widget/items_layout.dart';

class MainPage extends StatelessWidget {
  int count = 0;
  void incrementCount() {
    count++;
  }

  void decrementCount() {
    count--;
  }

  final List<ItemInformation> _itemData = [
    ItemInformation(
        title: "Item 1",
        description:
            "bread dough topped with some combination of olive oil, oregano, tomato, olives, mozzarella or other cheese, and many other ingredients",
        imageUrl:
            "https://static.toiimg.com/thumb/53110049.cms?width=1200&height=900"),
    ItemInformation(
        title: "Item 2",
        description:
            "a thin, flat, circular piece of cooked batter made from milk, flour, and eggs",
        imageUrl:
            "https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?ixlib=rb-1.2.1&w=1080&fit=max&q=80&fm=jpg&crop=entropy&cs=tinysrgb"),
    ItemInformation(
        title: "Item 3",
        description:
            "Tconsisting of fillings —usually a patty of ground meat, typically beef—placed inside a sliced bun or bread roll.",
        imageUrl:
            "https://www.chicken.ca/wp-content/uploads/2020/09/Moist-Chicken-Burgers.jpg"),
    ItemInformation(
        title: "Item 4",
        description:
            "a small, doughy piece of bread often used as a side dish, but may also be used to make sandwiches",
        imageUrl: "https://i.ytimg.com/vi/B5HdAw_Y0TU/maxresdefault.jpg"),
    ItemInformation(
        title: "Item 5",
        description:
            "a thin, flat, circular piece of cooked batter made from milk, flour, and eggs",
        imageUrl:
            "https://m.economictimes.com/thumb/height-450,width-600,imgsize-62007,msid-62098915/the-resurgence-of-indias-fast-food-industry.jpg"),
    ItemInformation(
        title: "Item 6",
        description: "Tomato sauce, frsh cream",
        imageUrl:
            "https://static.toiimg.com/thumb/53110049.cms?width=1200&height=900"),
    ItemInformation(
        title: "Item 7",
        description:
            "a small, doughy piece of bread often used as a side dish, but may also be used to make sandwiches",
        imageUrl:
            "https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?ixlib=rb-1.2.1&w=1080&fit=max&q=80&fm=jpg&crop=entropy&cs=tinysrgb"),
    ItemInformation(
        title: "Item 8",
        description: "Tomato sauce, frsh cream",
        imageUrl:
            "https://www.chicken.ca/wp-content/uploads/2020/09/Moist-Chicken-Burgers.jpg"),
    ItemInformation(
        title: "Item 9",
        description: "Tomato sauce, frsh cream",
        imageUrl:
            "https://static.toiimg.com/thumb/53110049.cms?width=1200&height=900"),
    ItemInformation(
        title: "Item 10",
        description: "Tomato sauce, frsh cream",
        imageUrl:
            "https://static.toiimg.com/thumb/53110049.cms?width=1200&height=900"),
  ];

  @override
  Widget build(BuildContext context) {
    final iconButton = Platform.isIOS
        ? CupertinoButton(
            child: const Icon(
              CupertinoIcons.shopping_cart,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartPage(count)));
            })
        : IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartPage(count)));
            },
            icon: const Icon(Icons.shopping_cart, color: Colors.black),
          );
    final bodyBuild = SafeArea(
      child: ListView.builder(
        itemCount: _itemData.length,
        itemBuilder: (context, index) {
          return ItemLayout(
              _itemData[index].imageUrl,
              _itemData[index].description,
              _itemData[index].title,
              decrementCount,
              incrementCount);
        },
      ),
    );
    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
                middle: Text("Food Delivery"), trailing: iconButton),
            child: bodyBuild)
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.grey.shade400,
              title: const Text("Food Delivery",
                  style: TextStyle(
                    color: Colors.black,
                  )),
              centerTitle: false,
              actions: [iconButton],
            ),
            body: bodyBuild);
  }
}
