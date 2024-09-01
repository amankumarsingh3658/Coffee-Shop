import 'package:coffee_shop/coffe%20data/coffee_shop.dart';
import 'package:coffee_shop/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:provider/provider.dart';

void main() async {
  // Initialize hive
  await Hive.initFlutter();

  // open a box
  await Hive.openBox("CARTBOX");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => CoffeeShop(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: HomePage(),
        ));
  }
}
