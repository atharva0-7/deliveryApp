import 'package:flutter/material.dart';
import 'package:food_delivery/data/models/item_information.dart';

class AddToCart with ChangeNotifier {
  List<CartItem> cartItems = [];
  int _totalCount = 0;
  double _totalPrice = 0;

  void incrementCartItemCount(CartItem cartItem) {
    cartItem.currentTotal += cartItem.price;
    cartItem.itemQuantity++;
    _totalCount++;
    _totalPrice += cartItem.price;
    notifyListeners();
  }

  void decrementCartItemCount(CartItem cartItem) {
    if (cartItem.itemQuantity == 1) {
      addToCart(cartItem, false);
    }
    cartItem.currentTotal -= cartItem.price;
    cartItem.itemQuantity--;
    _totalCount--;
    _totalPrice -= cartItem.price;
    if (_totalCount < 1) {
      _totalCount = 0;
    }
    notifyListeners();
  }

  void addToCart(CartItem cartItem, bool colorFlag) {
    if (colorFlag) {
      cartItem.currentTotal += cartItem.price;
      cartItems.add(cartItem);
      _totalPrice += cartItem.price;
      _totalCount++;
      cartItem.itemQuantity++;
    } else {
      cartItems.remove(cartItem);
      // _totalCount--;
      // _totalPrice -= cartItem.price;
    }
    notifyListeners();
  }

  void removeItemFromCart(CartItem currentItem) {
    cartItems.remove(currentItem);
    _totalPrice -= currentItem.price * currentItem.itemQuantity;
    _totalCount -= currentItem.itemQuantity;
    currentItem.currentTotal = 0;
    currentItem.itemQuantity = 0;
    // _totalCount--;
    notifyListeners();
  }

  getTotalCount() {
    return _totalCount;
  }

  getTotalPrice() {
    return _totalPrice;
  }
}
