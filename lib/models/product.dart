class Product {
  final String id;
  final String name, image, price;
  final String? discountPrice;
  final bool isFavorite;

  final List<ProductShop> shops;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.discountPrice,
    required this.image,
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
}
