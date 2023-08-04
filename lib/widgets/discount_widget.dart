import 'package:flutter/material.dart';

class DiscountWidget extends StatelessWidget {
  final String text;

  const DiscountWidget({this.text = 'DISCOUNT'});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15))),
      child: Text(
        this.text,
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      ),
    );
  }
}
