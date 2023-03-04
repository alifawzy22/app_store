import 'dart:convert';
import 'package:app_store/api/api.dart';
import 'package:app_store/models/model_product.dart';

class AllProductsService {
  Future<List<ModelProduct>> getAllProducts() async {
    var response =
        await Api().get(
      Uri.parse('https://fakestoreapi.com/products'),
    );

    List<Map<String, dynamic>> data = jsonDecode(response.body);

    List<ModelProduct> productsList = [];

    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ModelProduct.fromJson(data[i]),
      );
    }
    return productsList;
  }
}
