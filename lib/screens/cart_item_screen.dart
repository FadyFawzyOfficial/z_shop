import 'package:flutter/material.dart';

import '../models/cart_item.dart';

class CartItemScreen extends StatelessWidget {
  static final String route = '/cartItem';

  @override
  Widget build(BuildContext context) {
    CartItem cartItem = ModalRoute.of(context).settings.arguments as CartItem;

    return Scaffold(
      appBar: AppBar(title: Text(cartItem.name)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset(cartItem.image, width: 400, height: 300),
              const SizedBox(height: 16),
              Row(
                children: <Widget>[
                  const Text('Receipt',
                      style: TextStyle(fontSize: 26, fontFamily: 'Alata')),
                  const Spacer(),
                  Text(cartItem.dateOfPurchase)
                ],
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    width: 80,
                    child: const Text(
                      'Quantity',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(cartItem.count.toString())
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: <Widget>[
                  const SizedBox(
                    width: 80,
                    child: const Text(
                      'Price',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(cartItem.price),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: <Widget>[
                  const SizedBox(
                    width: 80,
                    child: const Text(
                      'Total',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    cartItem.total.toString(),
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
