import 'package:ecommerce_flutter/models/product_details_model.dart';
import 'package:http/http.dart' as http;

class ProductDetailsDataService {
  static const String url =
      'https://random-data-api.com/api/commerce/random_commerce?size=20';

  static Future<List<ModelProductDetails>> getDetails() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<ModelProductDetails> details =
            modelProductImgFromJson(response.body);
        return details;
      } else {
        throw Exception('Failed to load details');
      }
    } catch (e) {
      throw Exception('Somethig went wrong');
    }
  }
}
