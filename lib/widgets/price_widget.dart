import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  final String price;
  final Color color;
  final double fontSize;
  final TextDecoration textDecoration;
  final FontWeight fontWeight;

  const PriceWidget({
    super.key,
    required this.price,
    required this.color,
    required this.fontSize,
    this.fontWeight = FontWeight.bold,
    this.textDecoration = TextDecoration.none,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: price,
        style: TextStyle(
            decoration: textDecoration,
            fontWeight: fontWeight,
            fontSize: fontSize,
            color: color),
        children: const [
          TextSpan(
            text: ' EGP/Piece',
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 12,
                color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
