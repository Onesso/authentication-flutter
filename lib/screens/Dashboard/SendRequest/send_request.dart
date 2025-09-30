import 'package:flutter/material.dart';
import 'package:authentication/widgets/custom_drawer/menu_drawer.dart';

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
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F0EF),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            openFullScreenDrawer(context);
          },
          splashColor: Colors.red.withAlpha(50),
          highlightColor: Colors.green.withAlpha(30),
          icon: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            padding: const EdgeInsets.all(10.0),
            child: const Icon(Icons.menu, size: 22, color: Colors.blue),
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {},
            splashColor: Colors.red.withAlpha(50),
            highlightColor: Colors.green.withAlpha(30),
            icon: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
              padding: const EdgeInsets.all(10.0),
              child: const Icon(
                Icons.person_2_outlined,
                size: 22,
                color: Colors.blue,
              ),
            ),
          ),

          // You can add more icons here if needed
        ],
      ),
      backgroundColor: const Color(0xFFF2F0EF),
      body: Center(
        child: Text(
          "Send / Request Page is working",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
