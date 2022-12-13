import 'dart:convert';
import 'package:ecommerce_flutter/models/product_details_model.dart';
import 'package:http/http.dart' as http;

class ProductDetailsDataService {
  static const String url =
      'https://random-data-api.com/api/commerce/random_commerce';
  static Future<ModelProductDetails> fetchData() async {
    http.Response response;
    response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);
    print('details:' + response.body);
    return ModelProductDetails.fromJson(json);
  }
}
