
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/cart_page.dart';
import 'package:food_delivery/providers/add_to_cart_provider.dart';
import 'package:provider/provider.dart';
import '../item_list.dart';
import '../widget/items_layout.dart';

class MainPage extends StatelessWidget {  
  

  @override
  Widget build(BuildContext context) {
    int totalCount = Provider.of<AddToCart>(context).cartItems.length;
    final iconButton = totalCount == 0 ? IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartPage()));
            },
            icon: const Icon(Icons.shopping_cart, color: Colors.black),
          ):
      Positioned(
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 1.0,
                          right: 6.0,
                          child: Icon(
                            size: 20.0, color: Colors.red[800],
                            Icons.brightness_1)),
                         Positioned(
                            top: 4.0,
                            right: 12.0,
                            child:  Center(
                              child: Text(totalCount.toString(),
                                
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 11.0,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            )),
                             IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartPage()));
            },
            icon: const Icon(Icons.shopping_cart, color: Colors.black),
          )


                      ],
                    ));
     
      
 
       
    final bodyBuild = SafeArea(
      child: ListView.separated (
        separatorBuilder: (b,i)=>Divider(color: Colors.black,height: 1,),
        itemCount: itemData.length,
        itemBuilder: (context, index) {
          return ItemLayout(itemData[index]);
        },
      ),
    );
    return   Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: const Text("Food Delivery",
                    style: TextStyle(
                      color: Colors.black,
                    )),
                centerTitle: false,
                actions: [
                  iconButton],
              ),
              body: bodyBuild);
  
  }
}
