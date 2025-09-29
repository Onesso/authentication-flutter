import 'package:flutter/material.dart';

/// Opens a full-screen drawer overlay.
/// Call this function from any widget by passing `context`.
void openFullScreenDrawer(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Drawer",
    transitionDuration: const Duration(milliseconds: 350),
    pageBuilder: (context, animation, secondaryAnimation) {
      return Scaffold(
        backgroundColor: Colors.white,

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
                      Icons.arrow_back_outlined,
                      color: Colors.black,
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                  const Text(
                    "Menu",
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
