import 'package:flutter/material.dart';
import 'package:food_delivery/data/models/item_information.dart';
import 'package:food_delivery/providers/add_to_cart_provider.dart';
import 'package:food_delivery/widget/rating_layout.dart';
import 'package:provider/provider.dart';

class ItemLayout extends StatelessWidget {
  final CartItem currItem;
  BuildContext contextFromOtherPage;
  ItemLayout(this.currItem, this.contextFromOtherPage);

  String truncateWithEllipsis(int cutoff, String myString) {
    return (myString.length <= cutoff)
        ? myString
        : '${myString.substring(0, cutoff)}...';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currItem.title,
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      truncateWithEllipsis(100, currItem.description),
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const RatingBar(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          currItem.image,
                          fit: BoxFit.fill,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "\$${currItem.price}",
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      width: 120,
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                  width: 1.0,
                                  color: contextFromOtherPage
                                          .watch<AddToCart>()
                                          .cartItems
                                          .contains(currItem)
                                      ? Colors.green
                                      : Colors.red)),
                          onPressed: () {
                            if (!contextFromOtherPage
                                .read<AddToCart>()
                                .cartItems
                                .contains(currItem)) {
                              contextFromOtherPage
                                  .read<AddToCart>()
                                  .addToCart(currItem, true);
                            }
                          },
                          child: !contextFromOtherPage
                                  .watch<AddToCart>()
                                  .cartItems
                                  .contains(currItem)
                              ? const Text(
                                  "ADD",
                                  style: TextStyle(color: Colors.red),
                                )
                              : GestureDetector(
                                  onTap: () {},
                                  child: FittedBox(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              Provider.of<AddToCart>(context,
                                                      listen: false)
                                                  .decrementCartItemCount(
                                                      currItem);
                                            },
                                            icon: const Icon(Icons.remove)),
                                        Text(
                                          currItem.itemQuantity.toString(),
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              Provider.of<AddToCart>(context,
                                                      listen: false)
                                                  .incrementCartItemCount(
                                                      currItem);
                                            },
                                            icon: const Icon(Icons.add))
                                      ],
                                    ),
                                  ),
                                )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        const Divider()
      ],
    );
  }
}
