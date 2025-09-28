import 'package:flutter/cupertino.dart';

void phoneCanNotUseBiometrics(BuildContext context) {
  showCupertinoDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: const Text(
          '⚠️ Warning',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: CupertinoColors.destructiveRed,
          ),
        ),
        content: const Text(
          'Sorry your device does not support\n'
          'Biometri authentication.',
          textAlign: TextAlign.center,
        ),
        actions: [
          CupertinoDialogAction(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(); // close dialog
            },
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text('Okay'),
            onPressed: () {
              Navigator.of(context).pop(); // you can add custom logic here
            },
          ),
        ],
      );
    },
  );
}
