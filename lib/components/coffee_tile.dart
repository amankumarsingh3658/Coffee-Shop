import 'package:coffee_shop/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  Coffee coffee;
  void Function()? onPressed;
  Icon icon;
  CoffeeTile(
      {super.key,
      required this.coffee,
      required this.onPressed,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListTile(
          title: Text(coffee.name),
          subtitle: Text(coffee.price),
          leading: Image.asset(coffee.imagePath),
          trailing: IconButton(onPressed: onPressed, icon: icon),
        ),
      ),
    );
  }
}
