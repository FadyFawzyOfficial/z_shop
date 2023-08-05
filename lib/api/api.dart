import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/cart_item.dart';
import '../models/product.dart';
import '../models/shop.dart';

class Api {
  static String serverIP = '192.168.1.2';

  static final List<Shop> _shops = [
    Shop(
        id: "1",
        name: 'Carrefour',
        image: 'assets/images/carrefour.jpg',
        items: [
          ShopItem(
            name: 'Juhayana Full Cream Milk',
            price: '15.70',
            image: 'assets/images/juhayna.jpg',
          ),
          ShopItem(
            name: 'Heinz Tomato Paste',
            price: '10.75',
            image: 'assets/images/Heinz.jpg',
          ),
          ShopItem(
            name: 'Nestle Quality Street Chocolate',
            price: '170',
            discountPrice: '145.95',
            image: 'assets/images/Nestle Quality Street Chocolate.jpg',
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
            image: 'assets/images/Pampers.jpg',
          ),
          ShopItem(
            name: 'Heinz Tomato Paste',
            price: '12',
            image: 'assets/images/Heinz.jpg',
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
            image: 'assets/images/Pampers.jpg',
          ),
          ShopItem(
            name: 'Heinz Tomato Paste',
            price: '11',
            image: 'assets/images/Heinz.jpg',
          ),
        ]),
  ];

  static final List<CartItem> _items = [];

  static Future<List<Product>> fetchProducts() async {
    try {
      final response =
          await http.get(Uri.parse('http://$serverIP:3000/products'));

      if (response.statusCode == 200) {
        final List<dynamic> productsData = json.decode(response.body);
        return productsData.map((product) => Product.fromMap(product)).toList();
      } else {
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<Product> fetchProduct(String id) async {
    try {
      final response = await http.get(
        Uri.parse('http://$serverIP:3000/products/$id'),
      );

      if (response.statusCode == 200) {
        return Product.fromMap(json.decode(response.body));
      } else {
        throw Exception('Not Found');
      }
    } catch (e) {
      debugPrint('$e');
      rethrow;
    }
  }

  static Future<List<Shop>> fetchShops() async {
    await Future.delayed(const Duration(seconds: 2));

    return _shops;
  }

  static Future<Shop> fetchShop(String id) async {
    await Future.delayed(const Duration(seconds: 2));

    var p = _shops.singleWhere((element) => element.id == id);

    return p;
  }

  static Future<List<CartItem>> loadCart() async {
    try {
      final response = await http.get(Uri.parse('http://$serverIP:3000/cart'));

      if (response.statusCode == 200) {
        return List.from(json
            .decode(response.body)
            .map((cartItem) => CartItem.fromMap(cartItem)));
      } else {
        throw Exception('Not Found');
      }
    } catch (e) {
      debugPrint('$e');
      rethrow;
    }
  }

  static Future<String> addToCart(CartItem cartItem) async {
    try {
      final response = await http.post(
        Uri.parse('http://$serverIP:3000/cart'),
        headers: {'content-type': 'application/json'},
        body: cartItem.toJson(),
      );

      if (response.statusCode == 201) {
        debugPrint(response.headers['location']);
        return response.headers['location']!.replaceFirst('/cart/', '');
      } else {
        throw Exception('Not Created');
      }
    } catch (e) {
      debugPrint('$e');
      rethrow;
    }
  }

  static Future<void> updateCartItem(CartItem cartItem) async {
    try {
      final response = await http.patch(
        Uri.parse('http://$serverIP:3000/cart/${cartItem.id}'),
        headers: {'content-type': 'application/json'},
        body: cartItem.toJson(),
      );

      if (response.statusCode != 200) throw Exception('Not Created');
    } catch (e) {
      debugPrint('$e');
      rethrow;
    }
  }

  static Future<void> removeFromCart(String id) async {
    try {
      final response =
          await http.delete(Uri.parse('http://$serverIP:3000/cart/$id'));

      if (response.statusCode != 200) throw Exception('Not Created');
    } catch (e) {
      debugPrint('$e');
      rethrow;
    }
  }

  static Future<void> placeOrder() async {
    await Future.delayed(const Duration(seconds: 2));

    _items.clear();
  }
}
