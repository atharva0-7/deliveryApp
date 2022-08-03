


import 'package:flutter/material.dart';
import 'package:food_delivery/providers/add_to_cart_provider.dart';
import 'package:provider/provider.dart';



class CartPage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

   
   
    return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.grey.shade400,
              title: const Text("Cart",
                  style: TextStyle(
                 
                    color: Colors.black,
                  )),
              centerTitle: false,
            ),
            body:
            Provider.of<AddToCart>(context).cartItems.isEmpty ? 
                const Center(child: Text("No Items are added to cart",style: TextStyle(fontSize:22,fontWeight: FontWeight.w500),))
            : ListView(
              
              children: [
                const Padding(
                  padding:  EdgeInsets.all(10.0),
                  child: Text("Cart Items",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700),),
                ),
              
                
                ...Provider.of<AddToCart>(context).cartItems.map((item)
                {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      trailing: FittedBox(
                        child: Row(children: [
                          IconButton(onPressed: (){
                            Provider.of<AddToCart>(context,listen: false).decrementCartItemCount(item);
                        
                          }, icon: const Icon(Icons.remove)),
                           IconButton(onPressed: (){
                             Provider.of<AddToCart>(context,listen: false).incrementCartItemCount(item);
                           }, icon: const Icon(Icons.add))
                        ]),
                      ),
                      subtitle: Text("Quantity: ${item.itemCount.toString()}" ),
                      title: Text(item.title,style: const TextStyle(fontWeight: FontWeight.bold),),
                      
                      leading: CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(item.imageUrl)),
                    ),
                  );
                }).toList()
              ],
            ));
  }   
}
