import 'package:flutter/material.dart';
import 'package:my_submission_app/model/salad_item.dart';

class Cart extends ChangeNotifier {
  List<SaladItem> saladShop = saladItemList;

  // List of items in user cart
  List<SaladItem> userCart = [];

  // Get list of salad for sale
  List<SaladItem> saladList() {
    return saladShop;
  }

  // Get cart
  List<SaladItem> getUserCart() {
    return userCart;
  }

  // Add item to cart
  void addUserCart(SaladItem salad) {
    userCart.add(salad);
    notifyListeners();
  }

  // Remove item to cart
  void removeUserCart(SaladItem salad) {
    userCart.remove(salad);
    notifyListeners();
  }
}
