import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/cart_item.dart';
import '../models/product.dart';
import '../models/shop.dart';

class Api {
  static String serverIP = '192.168.1.2';

  static List<Shop> _shops = [];

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
    try {
      final response = await http.get(Uri.parse('http://$serverIP:3000/shops'));

      if (response.statusCode != 200) throw Exception('Not Found');
      _shops = List.from(
        json.decode(response.body).map((shop) => Shop.fromMap(shop)),
      );
      return _shops;
    } catch (e) {
      debugPrint('$e');
      rethrow;
    }
  }

  static Shop fetchShop(String id) =>
      _shops.singleWhere((element) => element.id == id);

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

  static Future<void> placeOrder(String address) async {
    try {
      final response = await http.post(
        Uri.parse('http://$serverIP:3000/orders'),
        body: {'address': address},
      );

      if (response.statusCode != 201) throw Exception('Not Created');
    } catch (e) {
      debugPrint('$e');
      rethrow;
    }
  }
}
