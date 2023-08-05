import 'dart:convert';

class Shop {
  final String id;
  final String name;
  final String image;
  final List<ShopItem> items;

  Shop({
    required this.id,
    required this.name,
    required this.image,
    required this.items,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory Shop.fromMap(Map<String, dynamic> map) {
    return Shop(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      items: List<ShopItem>.from(
        (map['items']).map<ShopItem>((x) => ShopItem.fromMap(x)),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Shop.fromJson(String source) => Shop.fromMap(json.decode(source));
}

class ShopItem {
  final String name;
  final String image;
  final String price;
  final String? discountPrice;

  ShopItem({
    required this.name,
    required this.image,
    required this.price,
    this.discountPrice,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'discountPrice': discountPrice,
    };
  }

  factory ShopItem.fromMap(Map<String, dynamic> map) {
    return ShopItem(
      name: map['name'],
      image: map['image'],
      price: map['price'],
      discountPrice: map['discountPrice'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ShopItem.fromJson(String source) =>
      ShopItem.fromMap(json.decode(source));
}
