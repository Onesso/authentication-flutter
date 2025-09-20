import 'package:flutter/material.dart';

class CustomeButton extends StatelessWidget {
  const CustomeButton(
    this.text, {
    super.key,
    required this.onPressed,
    this.backgroundColor = Colors.blue,
    this.foregroundColor = Colors.white,
  });

  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color foregroundColor;

  @override
  Widget build(context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double buttonWidth = screenWidth * 0.75;
    return Center(
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          minimumSize: Size(buttonWidth, 50),
          foregroundColor: foregroundColor, // Text colors
          backgroundColor: backgroundColor, // Button background color
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19),
          ),
          textStyle: TextStyle(
            fontSize: 21,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
