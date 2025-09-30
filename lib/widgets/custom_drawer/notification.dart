import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

void openNotificationDrawer(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Drawer",
    transitionDuration: const Duration(milliseconds: 350),
    pageBuilder: (context, animation, secondaryAnimation) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 221, 220, 220),

        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Close button
              Stack(
                alignment: Alignment.center,
                children: [
                  ListTile(
                    leading: const Icon(
                      Symbols.arrow_back,
                      weight: 400,
                      size: 40,
                      color: Colors.black,
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                  const Text(
                    "Notifications",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      // Slide from left animation
      final offsetAnimation = Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(animation);

      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}
