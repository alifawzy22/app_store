import 'package:app_store/api/api.dart';
import 'package:app_store/models/model_product.dart';

class AllProductsService {
  Future<List<ModelProduct>> getAllProducts() async {
    List<dynamic> data = await Api().get(
      url: 'https://fakestoreapi.com/products',
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
