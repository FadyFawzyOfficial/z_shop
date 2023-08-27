import 'dart:convert';

class Product {
  final String id;
  String name;
  String image;
  String price;
  String? discountPrice;
  final bool isFavorite;

  final List<ProductShop> shops;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.discountPrice,
    required this.isFavorite,
    this.shops = const [],
  });

  Product copy() {
    return Product(
      id: id,
      name: name,
      price: price,
      discountPrice: discountPrice,
      image: image,
      isFavorite: isFavorite,
      shops: shops,
    );
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      price: map['price'],
      discountPrice: map['discountPrice'],
      isFavorite: map['isFavorite'],
      shops: map['shops'] == null
          ? []
          : map['shops']
              .map<ProductShop>((x) => ProductShop.fromMap(x))
              .toList(),
    );
  }

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}

class ProductShop {
  final String shopId;
  final String shopName;
  final String image;
  final String price;
  final String? discountPrice;

  ProductShop({
    required this.shopId,
    required this.shopName,
    required this.image,
    required this.price,
    this.discountPrice,
  });

  factory ProductShop.fromMap(Map<String, dynamic> map) {
    return ProductShop(
      shopId: map['id'],
      shopName: map['name'],
      image: map['image'],
      price: map['price'],
      discountPrice: map['discountPrice'],
    );
  }

  factory ProductShop.fromJson(String source) =>
      ProductShop.fromMap(json.decode(source));
}
