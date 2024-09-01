
import 'package:coffee_shop/coffe%20data/coffee_shop.dart';
import 'package:coffee_shop/components/coffee_tile.dart';
import 'package:coffee_shop/components/toastMessage.dart';
import 'package:coffee_shop/consts.dart';
import 'package:coffee_shop/models/coffee.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: backgroundColor,
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Heading message
                Text(
                  "How would you like your coffee?",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                // List of coffee to buy
                Expanded(
                  child: Consumer<CoffeeShop>(
                    builder: (context, value, child) {
                      return ListView.builder(
                          itemCount: value.coffeeShop.length,
                          itemBuilder: (context, index) {
                            // Get Individual Coffee
                            Coffee eachCoffee = value.coffeeShop[index];
                            return CoffeeTile(
                                icon: Icon(Icons.add),
                                coffee: eachCoffee,
                                onPressed: () {
                                  if (value.cart.contains(eachCoffee)) {
                                    showToastTessage(
                                        "${eachCoffee.name} is Already Present in Cart");
                                  } else {
                                    Provider.of<CoffeeShop>(context,
                                            listen: false)
                                        .addItemToCart(eachCoffee);
                                    showToastTessage(
                                        "${eachCoffee.name} Added To cart");
                                  }
                                });
                          });
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }
}
