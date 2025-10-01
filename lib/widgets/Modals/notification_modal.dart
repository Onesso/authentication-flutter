import 'package:flutter/material.dart';

class BottomSheetNotification extends StatelessWidget {
  const BottomSheetNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      color: Colors.grey[200], // 👈 background color
      child: SizedBox(
        child: Column(
          children: [
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Text(
                    'Notification options',
                    style: TextStyle(fontSize: 16),
                  ),
                  Positioned(
                    right: 0,
                    child: IconButton(
                      icon: const Icon(Icons.close, size: 20),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// return SizedBox(
//       height: 175,
//       child: SizedBox(
//         width: double.infinity, // take full width
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             const Text('Notification options', style: TextStyle(fontSize: 18)),
//             Positioned(
//               right: 0,
//               child: IconButton(
//                 icon: const Icon(Icons.close),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );