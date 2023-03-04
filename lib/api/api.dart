import 'package:http/http.dart' as http;
class Api
{
  Future<http.Response> get(Uri url) async{
    http.Response response = await http.get(url);

    if(response.statusCode == 200){
      //Success
      return response;
    }else{
      throw Exception(
          'There is an error with status code = ${response.statusCode}');
    }
  }
}