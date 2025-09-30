import 'package:flutter/material.dart';
import 'package:authentication/widgets/custom_drawer/menu_drawer.dart';
import 'package:shimmer/shimmer.dart';

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
      body: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Quick actions row (Send / Request / More)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (index) {
                return Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(width: 40, height: 10, color: Colors.white),
                  ],
                );
              }),
            ),
            const SizedBox(height: 24),

            // Recent transactions title placeholder
            Container(width: 120, height: 14, color: Colors.white),
            const SizedBox(height: 16),

            // Recent transactions list
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: [
                      // Avatar
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 12),

                      // Name & details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 140,
                              height: 12,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 8),
                            Container(
                              width: 100,
                              height: 10,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),

                      // Amount
                      Container(width: 50, height: 12, color: Colors.white),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
