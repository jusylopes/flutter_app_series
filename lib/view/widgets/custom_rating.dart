import 'package:flutter/material.dart';

class CustomRating extends StatelessWidget {
  final int number;
  final double size;
  final Color starColor;
  final Color textColor;
  final double fontSize;

  const CustomRating({
    super.key,
    required this.number,
    this.size = 48,
    this.starColor = Colors.amber,
    this.textColor = Colors.black,
    this.fontSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Stack(
        children: [
          Icon(Icons.star, color: starColor, size: size),
          Center(
            child: Text(
              number.toString(),
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
