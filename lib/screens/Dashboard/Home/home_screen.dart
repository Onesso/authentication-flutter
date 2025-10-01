import 'package:flutter/material.dart';
import 'package:authentication/widgets/custom_drawer/menu_drawer.dart';
import 'package:authentication/widgets/custom_drawer/notification.dart';
import 'package:authentication/widgets/custom_drawer/setting.dart';
import 'package:shimmer/shimmer.dart';

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
        backgroundColor: Colors.grey.shade100,
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
            onPressed: () {
              openNotificationDrawer(context);
            },
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
            onPressed: () {
              openSettingDrawer(context);
            },
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
      backgroundColor: const Color(0xFFEEEEEE),
      body: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListView.builder(
          itemCount: 5, // number of fake posts
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile row
                  Row(
                    children: [
                      // Profile picture
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Username bar
                      Container(width: 120, height: 12, color: Colors.white),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Post image placeholder
                  Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 12),

                  // Like/comment/share row
                  Row(
                    children: [
                      Container(width: 80, height: 12, color: Colors.white),
                      const SizedBox(width: 16),
                      Container(width: 60, height: 12, color: Colors.white),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Caption placeholder
                  Container(
                    width: double.infinity,
                    height: 12,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 8),
                  Container(width: 150, height: 12, color: Colors.white),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
