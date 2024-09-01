import 'package:coffee_shop/coffe%20data/coffee_shop.dart';
import 'package:coffee_shop/coffe%20data/hive_database.dart';
import 'package:coffee_shop/components/coffee_tile.dart';
import 'package:coffee_shop/consts.dart';
import 'package:coffee_shop/models/coffee.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<CoffeeShop>(context, listen: false).prepareData();
  }

  @override
  Widget build(BuildContext context) {
    // remove Item from Cart
    void removeItemFromCart(Coffee coffee) {
      Provider.of<CoffeeShop>(context, listen: false)
          .removeItemFromCart(coffee);
    }

    // Payment function
    void Function()? payNow() {}

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              // Heading
              Text(
                "Your Cart",
                style: TextStyle(fontSize: 20),
              ),

              // List Of Items in cart
              Expanded(child: Consumer<CoffeeShop>(
                builder: (context, value, child) {
                  return value.cart.isEmpty
                      ? Center(
                          child: Text(
                            "Your Cart Is Empty\n Please Add Some Coffees from The shop",
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        )
                      : ListView.builder(
                          itemCount: value.cart.length,
                          itemBuilder: (context, index) {
                            Coffee cartCoffee = value.cart[index];
                            return CoffeeTile(
                                icon: Icon(Icons.delete),
                                coffee: cartCoffee,
                                onPressed: () =>
                                    removeItemFromCart(cartCoffee));
                          });
                },
              )),
              Consumer<CoffeeShop>(builder: (context, value, child) {
                return Visibility(
                  visible: value.cart.isEmpty ? false : true,
                  child: GestureDetector(
                    onTap: () => payNow(),
                    child: Container(
                      height: 80,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: Colors.brown,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Pay Now",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
