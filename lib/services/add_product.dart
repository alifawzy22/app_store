import 'package:app_store/api/api.dart';

class AddProductService {
  Future<Map<String,dynamic>> addProduct({
    required String title,
    required String price,
    required String decs,
    required String image,
    required String category,
  }) async {
   Map<String,dynamic> data =await Api().post(
      url: 'https://fakestoreapi.com/products',
      body: {
        'title': title,
        'price': price,
        'description': decs,
        'image': image,
        'category': category,
      },
      
    );

    return data;
  }
}
