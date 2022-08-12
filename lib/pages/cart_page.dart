import 'package:flutter/material.dart';
import 'package:food_delivery/providers/add_to_cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  Provider.of<AddToCart>(contextFormOtherPage).cartItems;

    return Scaffold(
        bottomNavigationBar: context.watch<AddToCart>().cartItems.isEmpty
            ? null
            : Container(
                height: 70,
                color: Colors.blue.shade300,
                child: Row(children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
                    child: Text("Subtotal:",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w700)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      "\$${Provider.of<AddToCart>(context).getTotalPrice().toStringAsFixed(2)}",
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  )
                ]),
              ),
        appBar: AppBar(
          leading: IconButton(
            onPressed: (() => Navigator.pop(context)),
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: const Text("Cart",
              style: TextStyle(
                color: Colors.black,
              )),
          centerTitle: false,
        ),
        body: context.watch<AddToCart>().cartItems.isEmpty
            ? const Center(
                child: Text(
                "No Items are added to cart",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ))
            : ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Cart Items",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                  ),
                  ...Provider.of<AddToCart>(context).cartItems.map((item) {
                    return Dismissible(
                      background: Container(
                        color: Colors.red,
                        child: const Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            )),
                      ),
                      direction: DismissDirection.endToStart,
                      // behavior: HitTestBehavior.translucent,
                      onDismissed: ((direction) {
                        Provider.of<AddToCart>(context, listen: false)
                            .removeItemFromCart(item);

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            duration: const Duration(seconds: 1),
                            content: SizedBox(
                                height: 40,
                                child:
                                    Text('${item.title} REMOVED FROM CART'))));
                      }),
                      key: UniqueKey(),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            trailing: FittedBox(
                              child: Column(
                                children: [
                                  Row(children: [
                                    IconButton(
                                        onPressed: () {
                                          context
                                              .read<AddToCart>()
                                              .decrementCartItemCount(item);
                                        },
                                        icon: const Icon(Icons.remove)),
                                    IconButton(
                                        onPressed: () {
                                          context
                                              .read<AddToCart>()
                                              .incrementCartItemCount(item);
                                        },
                                        icon: const Icon(Icons.add))
                                  ]),
                                  Text(
                                    "\$${item.currentTotal.toStringAsFixed(2)}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "Quantity: ${item.itemQuantity.toString()}"),
                                Text(
                                    "Price: \$${item.price.toStringAsFixed(2)}"),
                              ],
                            ),
                            title: Text(
                              item.title,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            leading: SizedBox(
                              height: 70,
                              width: 50,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  item.image,
                                  fit: BoxFit.fill,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
                                            : null,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          )),
                    );
                  }).toList(),
                  const Divider(),
                ],
              ));
  }
}
