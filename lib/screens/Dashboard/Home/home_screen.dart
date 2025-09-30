import 'package:flutter/material.dart';
import 'package:authentication/widgets/custom_drawer/menu_drawer.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() {
    return _Homescreen();
  }
}

class _Homescreen extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: const Color.fromARGB(255, 255, 251, 251),
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
          // First IconButton (e.g., Search)
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
                Icons.notifications_none_outlined,
                size: 22,
                color: Colors.blue,
              ),
            ),
          ),
          // Second IconButton (e.g., Settings)
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
      // backgroundColor: const Color.fromARGB(255, 255, 251, 251),
      backgroundColor: const Color(0xFFF2F0EF),

      body: Center(
        child: Text("Home page is working", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
