import 'package:flutter/material.dart';

class CartItem {
  final String id;
  int count;
  final String productId;
  final String name;
  String price;
  final String image;
  String dateOfPurchase;
  String shopId;

  double get total => double.parse(price) * count;

  CartItem({
    @required this.id,
    @required this.count,
    @required this.productId,
    @required this.name,
    @required this.price,
    @required this.image,
    @required this.dateOfPurchase
  });
}
