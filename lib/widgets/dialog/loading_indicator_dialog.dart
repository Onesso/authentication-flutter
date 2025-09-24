import 'package:flutter/cupertino.dart';

void showLoadingModal(BuildContext context) {
  showCupertinoDialog(
    context: context,

    barrierDismissible: true,
    builder: (BuildContext context) {
      return const Center(
        child: SizedBox(
          width: 130,
          height: 130,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Color(0xFCFFFFFF),

              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: CupertinoActivityIndicator(
              radius: 25,
              color: CupertinoColors.activeBlue,
            ),
          ),
        ),
      );
    },
  );
}

void dismissLoadingModal(BuildContext context) {
  Navigator.of(context).pop();
}

 
