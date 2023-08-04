import 'package:flutter/cupertino.dart';

class Product {
  final String id;
  final String name, image;
  String price, discountPrice;
  final bool isFavorite;

  final List<ProductShop> shops;

  Product(
      {@required this.id,
      @required this.name,
      @required this.price,
      @required this.discountPrice,
      @required this.image,
      @required this.isFavorite,
      this.shops = const []});

  Product copy() => Product(
      id: this.id,
      name: this.name,
      price: this.price,
      discountPrice: this.discountPrice,
      image: this.image,
      isFavorite: this.isFavorite,
      shops: this.shops);
}

class ProductShop {
  final String shopId;
  final String shopName;
  final String image;
  final String price;
  final String discountPrice;

  ProductShop(
      {@required this.shopId,
      @required this.shopName,
      @required this.image,
      @required this.price,
      this.discountPrice});
}
