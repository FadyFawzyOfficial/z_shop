import 'package:flutter/material.dart';

class DiscountWidget extends StatelessWidget {
  final String text;

  const DiscountWidget({super.key, this.text = 'DISCOUNT'});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15)),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      ),
    );
  }
}
