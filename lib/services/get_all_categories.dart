import 'dart:convert';
import 'package:app_store/api/api.dart';

class AllProductsService {
  Future<List<dynamic>> getAllCategories() async {
    var response = await Api().get(
      Uri.parse('https://fakestoreapi.com/products/categories'),
    );

    List<dynamic> data = jsonDecode(response.body);

    return data;
  }
}
