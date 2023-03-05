import 'package:app_store/models/model_product.dart';
import 'package:app_store/screens/update_product.dart';
import 'package:app_store/services/get_all_categories.dart';
import 'package:app_store/services/get_all_products.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../widgets/custom_stack.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = 'Home Page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'New Trend',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.cartPlus,
              color: Colors.black,
              size: 24,
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<ModelProduct>>(
        future: AllProductsService().getAllProducts(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            List<ModelProduct> productList = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.only(top: 80),
              child: GridView.builder(
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 4 / 5,
                  crossAxisSpacing: 10,
                  //mainAxisSpacing: 10,
                ),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, UpdateProduct.id,
                          arguments: productList[index]);
                    },
                    child: customStack(
                      product: productList[index],
                    ),
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                'There is an Error',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}
