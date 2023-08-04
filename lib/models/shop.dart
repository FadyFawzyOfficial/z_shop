import 'package:flutter/cupertino.dart';

class Shop {
  final String id, name, image;
  final List<ShopItem> items;

  Shop({
    @required this.id,
    @required this.name,
    @required this.image,
    @required this.items,
  });
}

class ShopItem {
  final name, image, price, discountPrice;

  ShopItem({
    @required this.name,
    @required this.image,
    @required this.price,
    this.discountPrice,
  });
}
