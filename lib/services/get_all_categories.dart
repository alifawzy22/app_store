import 'package:app_store/api/api.dart';

class AllcategoryService {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data = await Api().get(
      url: 'https://fakestoreapi.com/products/categories',
    );

    return data;
  }
}
