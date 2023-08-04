import 'dart:async';

import 'package:intl/intl.dart';

import '../models/cart_item.dart';
import '../models/product.dart';
import '../models/shop.dart';

class Api {
  static int _lastId = 0;

  static List<Product> _products = [
    Product(
        id: "0",
        name: 'Nestle Quality Street Chocolate',
        price: '170',
        discountPrice: '145.95',
        image: 'assets/images/Nestle Quality Street Chocolate.jpg_480Wx480H',
        isFavorite: false,
        shops: [
          ProductShop(
            shopId: '1',
            shopName: 'Carrefour',
            image: 'assets/images/carrefour.jpg',
            price: '170',
            discountPrice: '145.95',
          ),
          ProductShop(
            shopId: '2',
            shopName: 'Hyperone',
            image: 'assets/images/hyperone.png',
            price: '172',
          ),
          ProductShop(
            shopId: '3',
            shopName: 'Spinneys',
            image: 'assets/images/spinneys.png',
            price: '180',
          ),
        ]),
    Product(
        id: "1",
        name: 'Ahmed Tea Earl Grey',
        price: '88.95',
        discountPrice: null,
        image: 'assets/images/Ahmad Tea Earl Grey Tea.jpg_480Wx480H',
        isFavorite: false,
        shops: [
          ProductShop(
            shopId: '1',
            shopName: 'Carrefour',
            image: 'assets/images/carrefour.jpg',
            price: '90',
          ),
          ProductShop(
            shopId: '2',
            shopName: 'Hyperone',
            image: 'assets/images/hyperone.png',
            price: '88.95',
          ),
        ]),
    Product(
        id: "2",
        name: 'Almarai Full Milk',
        price: '22.95',
        discountPrice: null,
        image: 'assets/images/almarai.jpg_480Wx480H',
        isFavorite: false,
        shops: [
          ProductShop(
            shopId: '1',
            shopName: 'Carrefour',
            image: 'assets/images/carrefour.jpg',
            price: '22.95',
          ),
        ]),
    Product(
        id: "3",
        name: 'Amira Vegetable Ghee',
        price: '62.95',
        discountPrice: null,
        image: 'assets/images/amira.jpg_480Wx480H',
        isFavorite: false,
        shops: [
          ProductShop(
            shopId: '2',
            shopName: 'Hyperone',
            image: 'assets/images/hyperone.png',
            price: '63',
          ),
          ProductShop(
            shopId: '3',
            shopName: 'Spinneys',
            image: 'assets/images/spinneys.png',
            price: '62.95',
          ),
        ]),
    Product(
        id: "4",
        name: 'Cadbury Bubbly Chocolate',
        price: '22.45',
        discountPrice: null,
        image: 'assets/images/Cadbury Bubbly Chocolate.jpg_480Wx480H',
        isFavorite: false,
        shops: [
          ProductShop(
            shopId: '1',
            shopName: 'Carrefour',
            image: 'assets/images/carrefour.jpg',
            price: '22.45',
          ),
          ProductShop(
            shopId: '2',
            shopName: 'Hyperone',
            image: 'assets/images/hyperone.png',
            price: '23',
          ),
          ProductShop(
            shopId: '3',
            shopName: 'Spinneys',
            image: 'assets/images/spinneys.png',
            price: '22.85',
          ),
        ]),
    Product(
        id: "5",
        name: 'Crystal Gold Vegetable Ghee',
        price: '64.55',
        discountPrice: null,
        image: 'assets/images/Crystal.jpg_480Wx480H',
        isFavorite: false,
        shops: [
          ProductShop(
            shopId: '3',
            shopName: 'Spinneys',
            image: 'assets/images/spinneys.png',
            price: '64.55',
          ),
        ]),
    Product(
        id: "6",
        name: 'Heinz Tomato Paste',
        price: '10.75',
        discountPrice: null,
        image: 'assets/images/Heinz.jpg_480Wx480H',
        isFavorite: false,
        shops: [
          ProductShop(
            shopId: '1',
            shopName: 'Carrefour',
            image: 'assets/images/carrefour.jpg',
            price: '10.75',
          ),
          ProductShop(
            shopId: '2',
            shopName: 'Hyperone',
            image: 'assets/images/hyperone.png',
            price: '12',
          ),
          ProductShop(
            shopId: '3',
            shopName: 'Spinneys',
            image: 'assets/images/spinneys.png',
            price: '11',
          ),
        ]),
    Product(
        id: "7",
        name: 'Juhayana Full Cream Milk',
        price: '15.70',
        discountPrice: null,
        image: 'assets/images/juhayna.jpg_480Wx480H',
        isFavorite: false,
        shops: [
          ProductShop(
            shopId: '1',
            shopName: 'Carrefour',
            image: 'assets/images/carrefour.jpg',
            price: '15.70',
          ),
        ]),
    Product(
        id: "8",
        name: 'Pampers',
        price: '160',
        discountPrice: null,
        image: 'assets/images/Pampers.jpg_480Wx480H',
        isFavorite: false,
        shops: [
          ProductShop(
            shopId: '2',
            shopName: 'Hyperone',
            image: 'assets/images/hyperone.png',
            price: '160',
          ),
          ProductShop(
            shopId: '3',
            shopName: 'Spinneys',
            image: 'assets/images/spinneys.png',
            price: '160.01',
          ),
        ])
  ];

  static List<Shop> _shops = [
    Shop(
        id: "1",
        name: 'Carrefour',
        image: 'assets/images/carrefour.jpg',
        items: [
          ShopItem(
            name: 'Juhayana Full Cream Milk',
            price: '15.70',
            image: 'assets/images/juhayna.jpg_480Wx480H',
          ),
          ShopItem(
            name: 'Heinz Tomato Paste',
            price: '10.75',
            image: 'assets/images/Heinz.jpg_480Wx480H',
          ),
          ShopItem(
            name: 'Nestle Quality Street Chocolate',
            price: '170',
            discountPrice: '145.95',
            image:
                'assets/images/Nestle Quality Street Chocolate.jpg_480Wx480H',
          ),
        ]),
    Shop(
        id: '2',
        name: 'Hyperone',
        image: 'assets/images/hyperone.png',
        items: [
          ShopItem(
            name: 'Pampers',
            price: '160',
            image: 'assets/images/Pampers.jpg_480Wx480H',
          ),
          ShopItem(
            name: 'Heinz Tomato Paste',
            price: '12',
            image: 'assets/images/Heinz.jpg_480Wx480H',
          ),
        ]),
    Shop(
        id: '3',
        name: 'Spinneys',
        image: 'assets/images/spinneys.png',
        items: [
          ShopItem(
            name: 'Pampers',
            price: '160.01',
            image: 'assets/images/Pampers.jpg_480Wx480H',
          ),
          ShopItem(
            name: 'Heinz Tomato Paste',
            price: '11',
            image: 'assets/images/Heinz.jpg_480Wx480H',
          ),
        ]),
  ];

  static List<CartItem> _items = [];

  static Future<List<Product>> fetchProducts() async {
    await Future.delayed(Duration(seconds: 2));

    return _products;
  }

  static Future<Product> fetchProduct(String id) async {
    await Future.delayed(Duration(seconds: 2));

    var p = _products.singleWhere((element) => element.id == id);

    if (p != null) p = p.copy();

    return p;
  }

  static Future<List<Shop>> fetchShops() async {
    await Future.delayed(Duration(seconds: 2));

    return _shops;
  }

  static Future<Shop> fetchShop(String id) async {
    await Future.delayed(Duration(seconds: 2));

    var p = _shops.singleWhere((element) => element.id == id);

    return p;
  }

  static Future<List<CartItem>> loadCart() async {
    await Future.delayed(Duration(seconds: 2));

    return _items;
  }

  static Future<void> addToCart(Product product) async {
    await Future.delayed(Duration(seconds: 1));

    CartItem item = _items.firstWhere(
        (element) => element.productId == product.id,
        orElse: () => null);

    if (item != null) {
      item.count++;

      item.dateOfPurchase = DateFormat(DateFormat.YEAR_ABBR_MONTH_WEEKDAY_DAY)
          .format(DateTime.now());
    } else {
      item = CartItem(
          id: (_lastId++).toString(),
          count: 1,
          productId: product.id,
          name: product.name,
          price: "0",
          image: product.image,
          dateOfPurchase: DateFormat(DateFormat.YEAR_ABBR_MONTH_WEEKDAY_DAY)
              .format(DateTime.now()));

      _items.add(item);
    }

    item.price = product.discountPrice ?? product.price;
    item.shopId = product.shops
        .firstWhere((element) => element.price == item.price,
            orElse: () => null)
        ?.shopId;
  }

  static Future<void> removeFromCart(CartItem item) async {
    await Future.delayed(Duration(seconds: 2));

    _items.remove(item);
  }

  static Future<void> placeOrder() async {
    await Future.delayed(Duration(seconds: 2));

    _items.clear();
  }
}
