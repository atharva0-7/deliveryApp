import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/data/models/item_information.dart';

Future getAllProducts(BuildContext context) async {
  try {
    print('before');
    var response = await Dio()
        .get("https://fakestoreapi.com/products")
        .timeout(const Duration(seconds: 5), onTimeout: () {
      throw ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        "Error:- Try again Later ",
        style: TextStyle(fontSize: 18),
      )));
    });
    // print('after');

    if (response.statusCode == 200) {
      var decodedJson =
          response.data.map((element) => (CartItem.fromJson(element))).toList();

      return decodedJson;
    } else {
      return [];
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
      "Error:- Try again Later",
      style: TextStyle(fontSize: 18),
    )));
    print(e);
  }
}
