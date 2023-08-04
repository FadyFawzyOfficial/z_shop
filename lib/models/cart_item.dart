import 'dart:convert';

class CartItem {
  String? id;
  int count;
  final String productId;
  final String name;
  String price;
  final String image;
  String dateOfPurchase;
  String? shopId;

  double get total => double.parse(price) * count;

  CartItem({
    this.id,
    required this.count,
    required this.productId,
    required this.name,
    required this.price,
    required this.image,
    required this.dateOfPurchase,
    this.shopId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'count': count,
      'productId': productId,
      'name': name,
      'price': price,
      'image': image,
      'date': dateOfPurchase,
      'shopId': shopId,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      id: map['id'],
      count: map['count'],
      productId: map['productId'],
      name: map['name'],
      price: map['price'],
      image: map['image'],
      dateOfPurchase: map['dateOfPurchase'],
      shopId: map['shopId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItem.fromJson(String source) =>
      CartItem.fromMap(json.decode(source) as Map<String, dynamic>);
}
