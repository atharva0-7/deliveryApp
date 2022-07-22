import 'package:flutter/material.dart';
import 'package:food_delivery/widget/rating_layout.dart';

class ItemLayout extends StatefulWidget {
  Function incrementCount;
  Function decrementCount;
  String title;
  String description;
  String imageUrl;

  ItemLayout(this.imageUrl, this.description, this.title, this.decrementCount,
      this.incrementCount);

  @override
  State<ItemLayout> createState() => _ItemLayoutState();
}

class _ItemLayoutState extends State<ItemLayout> {
  int count = 0;
  bool colorFlag = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(width: 1 / 8)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.description,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const RatingBar()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                        image: NetworkImage(widget.imageUrl),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                              width: 1.0,
                              color: colorFlag ? Colors.red : Colors.green),
                        ),
                        onPressed: () {
                          setState(() {
                            if (colorFlag) {
                              widget.incrementCount();
                              colorFlag = false;
                            } else {
                              widget.decrementCount();
                              colorFlag = true;
                            }
                          });
                        },
                        child: colorFlag
                            ? const Text(
                                "ADD",
                                style: TextStyle(color: Colors.red),
                              )
                            : const Text("Added",
                                style: TextStyle(color: Colors.green))),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
