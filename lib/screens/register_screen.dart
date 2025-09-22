import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7FFFE),
      appBar: AppBar(
        backgroundColor: Color(0xFFF7FFFE),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.pop(context); // takes user back
          },
        ),
      ),
      body: const Center(child: Text("Register Screen Content")),
    );
  }
}
