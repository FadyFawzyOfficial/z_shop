import 'package:flutter/material.dart';

import './price_widget.dart';

class ProductPriceWidget extends StatelessWidget {
  const ProductPriceWidget(this.price, {this.discountPrice});

  final String price;
  final String discountPrice;

  @override
  Widget build(BuildContext context) {
    final bool discount = discountPrice != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (discount)
          PriceWidget(price: discountPrice, color: Colors.red, fontSize: 16),
        PriceWidget(
          price: price,
          color: discount ? Colors.grey : Colors.black,
          fontSize: discount ? 14 : 16,
          textDecoration:
              discount ? TextDecoration.lineThrough : TextDecoration.none,
          fontWeight: discount ? FontWeight.normal : FontWeight.bold,
        ),
      ],
    );
  }
}
