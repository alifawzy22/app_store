import 'package:app_store/api/api.dart';
import 'package:app_store/models/model_product.dart';

class AllcategoryService {
  Future<List<ModelProduct>> getCategory({required String categoryName}) async {
    List<Map<String, dynamic>> data = await Api().get(
      url: 'https://fakestoreapi.com/products/category/$categoryName',
    );

    List<ModelProduct> productsList = [];

    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ModelProduct.fromJson(data[i]),
      );
    }
    return productsList;
  }
}
