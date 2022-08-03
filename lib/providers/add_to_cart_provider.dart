import 'package:flutter/material.dart';
import 'package:food_delivery/models/item_information.dart';

class AddToCart with ChangeNotifier{
  List<CartItem> cartItems = [];
  
  
  void incrementCartItemCount(CartItem cartItem)
  {
    cartItem.itemCount++;
    notifyListeners();
  }
    void decrementCartItemCount(CartItem cartItem)
  {
    if(cartItem.itemCount == 1)
    {
      addToCart(cartItem, false);
    }
    cartItem.itemCount--;
    notifyListeners();
  }
  
  void addToCart(CartItem currrentItem,bool colorFlag)
  {
    if(colorFlag)
    {
       cartItems.add(currrentItem);
       currrentItem.itemCount++;
     
    }else{
      cartItems.remove(currrentItem);
  
    }
    notifyListeners();
  }
}