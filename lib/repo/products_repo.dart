import 'package:bloc_pattern_cs_test/models/products_model.dart';
import 'package:http/http.dart' as http;

class ProductsRepo{
  Future<List<ProductsModel>> getProducts() async {
        var response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
       if(response.statusCode == 200){
        return productsModelFromJson(response.body);
       }
        else{
          throw Exception('Failed to load products');
        }
  }
}