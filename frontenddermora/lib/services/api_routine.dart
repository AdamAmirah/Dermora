import 'dart:convert';

import 'package:http/http.dart' as http;

import '../screens/routine/models/products.dart';

class ProductsApi {
  static const _api_key = "f952ec2bfcmsheaec78ad6ae78fdp15747ajsn9036bfc96962";
  static const String _baseUrl = "sephora.p.rapidapi.com";
  static const Map<String, String> _headers = {
    "content-type": "application/json",
    "X-RapidAPI-Host": "sephora.p.rapidapi.com",
    "X-RapidAPI-Key": "f952ec2bfcmsheaec78ad6ae78fdp15747ajsn9036bfc96962",
  };
  static Future<List<Products>> getProducts(String query) async {
    final queryParameters = {'q': query, 'pageSize': '60', 'currentPage': '1'};
    Uri uri = Uri.https(_baseUrl, "/products/search/", queryParameters);
    final response = await http.get(uri, headers: _headers);
    if (response.statusCode == 200) {
      ProductsModel res = convertProducts(response.body);
      print(res.keyword);
      return res.products;
    } else {
      print(response.body);
      throw Exception();
    }
  }

  static Future<List<Products>> getAllProducts() async {
    final queryParameters = {
      'categoryId': "cat150006",
      'pageSize': '10',
      'currentPage': '1'
    };
    Uri uri = Uri.https(_baseUrl, "/products/list/", queryParameters);
    final response = await http.get(uri, headers: _headers);
    if (response.statusCode == 200) {
      AllProductsModel res = convertAllProducts(response.body);
      return res.products;
    } else {
      print(response.body);
      throw Exception();
    }
  }
}
