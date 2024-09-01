import 'package:coffee_shop/coffe%20data/coffee_shop.dart';
import 'package:coffee_shop/components/bottom_nav_bar.dart';
import 'package:coffee_shop/consts.dart';
import 'package:coffee_shop/pages/cart_page.dart';
import 'package:coffee_shop/pages/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Load cart Items
  @override
  void initState() {
    super.initState();
    Provider.of<CoffeeShop>(context, listen: false).prepareData();
  }

  // Navigate to another tab
  int selectedIndex = 0;
  navigateBottomBar(int index) {
    selectedIndex = index;
    setState(() {});
  }

  //pages
  final List<Widget> pages = [
    // shop page
    ShopPage(),

    // cart page
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: pages[selectedIndex],
    );
  }
}
