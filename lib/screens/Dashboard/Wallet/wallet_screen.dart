import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() {
    return _Wallet();
  }
}

class _Wallet extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F0EF),
      body: Center(
        child: Text("Wallet Page is working", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
