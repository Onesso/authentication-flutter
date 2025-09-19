import 'package:flutter/material.dart';

class CustomeButton extends StatelessWidget {
  const CustomeButton(
    this.text, {
    super.key,
    required this.onPressed,
    this.backgroundColor = Colors.blue,
  });

  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;

  @override
  Widget build(context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double buttonWidth = screenWidth * 0.75;
    return Center(
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          minimumSize: Size(buttonWidth, 50),
          foregroundColor: Colors.white, // Text colors
          backgroundColor: backgroundColor, // Button background color
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19),
          ),
          textStyle: TextStyle(fontSize: 21),
        ),
        child: Text(text),
      ),
    );
  }
}
