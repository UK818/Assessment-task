import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tezda_assessent_task/model/product_model.dart';
import 'package:tezda_assessent_task/utils/constants.dart';

abstract class ProductServiceInterface {
  Future<List<Product>> getProducts();
}

class ProductService implements ProductServiceInterface {
  var storeUrl = Constants.storeURL;

  @override
  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse(storeUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
