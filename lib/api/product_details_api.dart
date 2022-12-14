import 'dart:convert';
import 'package:ecommerce_flutter/models/product_details_model.dart';
import 'package:http/http.dart' as http;

class ProductDetailsDataService {
  static const String url =
      'https://random-data-api.com/api/commerce/random_commerce';

  static Future<ModelProductDetails> fetchData() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return ModelProductDetails.fromJson(json);
      } else {
        throw Exception('Failed to load details');
      }
    } catch (e) {
      return ModelProductDetails();
    }
  }
}
