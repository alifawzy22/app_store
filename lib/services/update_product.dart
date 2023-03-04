import 'package:app_store/api/api.dart';

class UpdateProductService
{
    Future<Map<String,dynamic>> updateProduct({
    required String id,
    required String title,
    required String price,
    required String decs,
    required String image,
    required String category,
  }) async {
   Map<String,dynamic> data =await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
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