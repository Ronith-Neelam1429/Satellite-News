import 'package:flutter/material.dart';

class LongButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final Color color;
  final Color borderColor; // New parameter for border color
  final double borderWidth; // New parameter for border width

  const LongButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.color,
    this.borderColor = Colors.black, // Default border color
    this.borderWidth = 2.0, // Default border width
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: borderColor,
            width: borderWidth,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
