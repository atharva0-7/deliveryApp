
import 'package:flutter/material.dart';
import 'package:food_delivery/models/item_information.dart';
import 'package:food_delivery/providers/add_to_cart_provider.dart';
import 'package:food_delivery/widget/rating_layout.dart';
import 'package:provider/provider.dart';



class ItemLayout extends StatelessWidget {
  CartItem currItem;
  ItemLayout(this.currItem);
 
  
  @override
  Widget build(BuildContext context) {
    
   
    return Container(
      // decoration: BoxDecoration(border: Border.all(width: 1 / 8)),
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
                 currItem.title,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                 currItem.description,
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
                        image: NetworkImage(currItem.imageUrl),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                              width: 1.0,
                              color: Provider.of<AddToCart>(context).cartItems.contains(currItem)  && currItem.itemCount != 0 ? Colors.green : Colors.red),
                        ),
                        onPressed: () {
                          //  currItem.itemCount++;
   
                         Provider.of<AddToCart>(context,listen: false).cartItems.contains(currItem) && currItem.itemCount == 0?
                          context.read<AddToCart>().addToCart(currItem,false):
                          context.read<AddToCart>().addToCart(currItem,true);
                        },
                        child:!Provider.of<AddToCart>(context).cartItems.contains(currItem) || currItem.itemCount == 0
                            ? const Text(
                                "ADD",
                                style: TextStyle(color: Colors.red),
                              )
                            :  FittedBox(
                              child: Row(children: [
                                IconButton(onPressed: (){
                                  Provider.of<AddToCart>(context,listen: false).decrementCartItemCount(currItem);
                                }, icon:const  Icon(Icons.remove)),
                                Text(currItem.itemCount.toString(),style: const TextStyle(fontSize: 20),),
                                 IconButton(onPressed: (){
                                  Provider.of<AddToCart>(context,listen: false).incrementCartItemCount(currItem);
                                 }, icon: const Icon(Icons.add))
                              ],),
                            )),
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
