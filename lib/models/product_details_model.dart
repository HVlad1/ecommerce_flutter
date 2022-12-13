class ModelProductDetails {
  int? id;
  String? uid;
  String? color;
  String? department;
  String? material;
  String? productName;
  double? price;
  String? priceString;
  String? promoCode;

  ModelProductDetails(
      {this.id,
      this.uid,
      this.color,
      this.department,
      this.material,
      this.productName,
      this.price,
      this.priceString,
      this.promoCode});

  ModelProductDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    color = json['color'];
    department = json['department'];
    material = json['material'];
    productName = json['product_name'];
    price = json['price'];
    priceString = json['price_string'];
    promoCode = json['promo_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uid'] = uid;
    data['color'] = color;
    data['department'] = department;
    data['material'] = material;
    data['product_name'] = productName;
    data['price'] = price;
    data['price_string'] = priceString;
    data['promo_code'] = promoCode;
    return data;
  }
}
