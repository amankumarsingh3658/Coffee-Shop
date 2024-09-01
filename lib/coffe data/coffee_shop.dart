import 'package:coffee_shop/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier {
  // coffe for sale list
  List<Coffee> _shop = [
    // black coffee
    Coffee(
        name: 'Black Coffee',
        price: '50',
        imagePath: 'lib/images/blackcoffee.png'),

    // iced coffee
    Coffee(
        name: 'Iced Coffee',
        price: '60',
        imagePath: 'lib/images/icedcoffee.png'),

    // espresso
    Coffee(
        name: 'Espresso Coffee',
        price: '80',
        imagePath: 'lib/images/espresso.png'),

    // latte
    Coffee(
        name: 'Latte Coffee', price: '70', imagePath: 'lib/images/latte.png'),
  ];
  // user cart
  List<Coffee> _cart = [];

  // get coffee list
  List<Coffee> get coffeeShop => _shop;
  //get user cart
  List<Coffee> get cart => _cart;

  // add item to cart
  void addItemToCart(Coffee coffee) {
    _cart.add(coffee);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Coffee coffee) {
    _cart.remove(coffee);
    notifyListeners();
  }
}
