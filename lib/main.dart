import 'package:app_store/screens/home_page.dart';
import 'package:app_store/screens/update_product.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context) => HomePage(),
        UpdateProduct.id: (context) => UpdateProduct(),
      },
      initialRoute: HomePage.id,
    );
  }
}
