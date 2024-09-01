import 'dart:io';

import 'package:coffee_shop/models/coffee.dart';
import 'package:hive/hive.dart';

class HiveDatabase {
  // Open The box
  final _myBox = Hive.box("CARTBOX");

  // save data
  void saveData(List<Coffee> cartList) {
    List<List<dynamic>> formattedCart = [];

    for (var eachCoffee in cartList) {
      List<dynamic> everyCartItem = [
        eachCoffee.name,
        eachCoffee.price,
        eachCoffee.imagePath
      ];
      formattedCart.add(everyCartItem);
    }
    _myBox.put("CARTITEMS", formattedCart);
  }

  // get data
  List<Coffee> getData() {
    List<Coffee> allCartCoffee = [];
    List savedData = _myBox.get("CARTITEMS");

    for (var i = 0; i < savedData.length; i++) {
      String name = savedData[i][0];
      String price = savedData[i][1];
      String imagePath = savedData[i][2];

      Coffee cartCoffee =
          Coffee(name: name, price: price, imagePath: imagePath);
      allCartCoffee.add(cartCoffee);
    }
    return allCartCoffee;
  }
}
