import 'dart:convert';

List<ModelProductDetails> modelProductImgFromJson(String str) =>
    List<ModelProductDetails>.from(
        json.decode(str).map((x) => ModelProductDetails.fromJson(x)));

String modelProductImgToJson(List<ModelProductDetails> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelProductDetails {
  ModelProductDetails({
    required this.id,
    required this.uid,
    required this.color,
    required this.department,
    required this.material,
    required this.productName,
    required this.price,
    required this.priceString,
    required this.promoCode,
  });

  int id;
  String uid;
  String color;
  String department;
  String material;
  String productName;
  double price;
  String priceString;
  String promoCode;

  factory ModelProductDetails.fromJson(Map<String, dynamic> json) =>
      ModelProductDetails(
        id: json["id"],
        uid: json["uid"],
        color: json["color"],
        department: json["department"],
        material: json["material"],
        productName: json["product_name"],
        price: json["price"],
        priceString: json["price_string"],
        promoCode: json["promo_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "color": color,
        "department": department,
        "material": material,
        "product_name": productName,
        "price": price,
        "price_string": priceString,
        "promo_code": promoCode
      };
}
