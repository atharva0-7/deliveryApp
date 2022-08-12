import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/data/source/remote/get_all_products.dart';
import 'package:food_delivery/pages/cart_page.dart';
import 'package:food_delivery/providers/add_to_cart_provider.dart';
import 'package:food_delivery/widget/items_layout.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  final AsyncSnapshot snapshot;
  const MainPage({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Food Delivery",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Badge(
              toAnimate: false,
              // shape: BadgeShape.square,
              badgeColor: Colors.redAccent,
              // borderRadius: BorderRadius.circular(),
              badgeContent: Text(
                  Provider.of<AddToCart>(context).getTotalCount().toString(),
                  style: const TextStyle(color: Colors.white)),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => CartPage()));
                },
                child: const Icon(
                  Icons.shopping_bag,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => getAllProducts(context),
        child: ListView.builder(
            physics: const PageScrollPhysics(),
            itemCount: snapshot.data!.length,
            itemBuilder: ((context, index) {
              return ItemLayout(snapshot.data[index], context);
            })),
      ),
    );
  }
}
