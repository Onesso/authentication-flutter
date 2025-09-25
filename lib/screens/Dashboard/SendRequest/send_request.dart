import 'package:flutter/material.dart';

class SendRequest extends StatefulWidget {
  const SendRequest({super.key});

  @override
  State<SendRequest> createState() {
    return _SendRequest();
  }
}

class _SendRequest extends State<SendRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("💸 Send / Request Page", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
