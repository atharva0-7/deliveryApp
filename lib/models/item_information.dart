import 'package:flutter/widgets.dart';

class CartItem {
  String title;
  String description;
  String imageUrl;
  int itemCount;

  CartItem(
      {required this.title, required this.description, required this.imageUrl,required this.itemCount});
}
