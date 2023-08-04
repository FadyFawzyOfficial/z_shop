class Shop {
  final String id, name, image;
  final List<ShopItem> items;

  Shop({
    required this.id,
    required this.name,
    required this.image,
    required this.items,
  });
}

class ShopItem {
  final String name, image, price;
  final String? discountPrice;

  ShopItem({
    required this.name,
    required this.image,
    required this.price,
    this.discountPrice,
  });
}
