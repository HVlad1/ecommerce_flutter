import 'package:http/http.dart' as http;

import '../models/product_image_model.dart';

class ProductImageDataService {
  static const String url = 'https://picsum.photos/v2/list?page=2&limit=100';

  static Future<List<ModelProductImg>> getImages() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<ModelProductImg> images =
            modelProductImgFromJson(response.body);
        return images;
      } else {
        return <ModelProductImg>[];
      }
    } catch (e) {
      return <ModelProductImg>[];
    }
  }
}
