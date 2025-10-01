// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

void openFullScreenDrawer(BuildContext context) {
  final double screenWidth = MediaQuery.of(context).size.width;
  final double textWidth = screenWidth * 0.90;

  showGeneralDialog(
    context: context,
    barrierLabel: "Drawer",
    transitionDuration: const Duration(milliseconds: 350),
    pageBuilder: (context, animation, secondaryAnimation) {
      return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                //Closing arrow button
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
                      "Menu",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ],
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.015),

                // manage finance section
                SizedBox(
                  width: textWidth,
                  child: Text(
                    'Manage finance',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.010),
                SizedBox(
                  width: textWidth,
                  child: Container(
                    color: Colors.white,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton.icon(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          icon: Icon(
                            Symbols.payment_card,
                            weight: 200, // or whatever weight you want
                            size: 40,
                            color: Colors.black,
                          ),
                          // 2. Label (The text element)
                          label: const Text(
                            'Payment preference',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          icon: Icon(
                            Symbols.credit_card,
                            weight: 200, // or whatever weight you want
                            size: 40,
                            color: Colors.black,
                          ),
                          // 2. Label (The text element)
                          label: const Text(
                            'Add banks and cards',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Send and pay
                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                SizedBox(
                  width: textWidth,
                  child: Text(
                    'Send and Pay',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.010),
                SizedBox(
                  width: textWidth,
                  child: Container(
                    color: Colors.white,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton.icon(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          icon: Icon(
                            Symbols.send,
                            weight: 200, // or whatever weight you want
                            size: 40,
                            color: Colors.black,
                          ),
                          // 2. Label (The text element)
                          label: const Text(
                            'Send to a paypal account',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          icon: Icon(
                            Symbols.receipt_long,
                            weight: 200, // or whatever weight you want
                            size: 40,
                            color: Colors.black,
                          ),
                          // 2. Label (The text element)
                          label: const Text(
                            'Pay bills',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Get paid
                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                SizedBox(
                  width: textWidth,
                  child: Text(
                    'Get paid',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.010),
                SizedBox(
                  width: textWidth,
                  child: Container(
                    color: Colors.white,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton.icon(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          icon: Icon(
                            Symbols.payments,
                            weight: 200, // or whatever weight you want
                            size: 40,
                            color: Colors.black,
                          ),
                          // 2. Label (The text element)
                          label: const Text(
                            'Request money',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                      ],
                    ),
                  ),
                ),
                // profile and support
                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                SizedBox(
                  width: textWidth,
                  child: Text(
                    'Profile and support',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.010),
                SizedBox(
                  width: textWidth,
                  child: Container(
                    color: Colors.white,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton.icon(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          icon: Icon(
                            Symbols.account_circle,
                            weight: 200, // or whatever weight you want
                            size: 40,
                            color: Colors.black,
                          ),
                          // 2. Label (The text element)
                          label: const Text(
                            'Your profile',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          icon: Icon(
                            Symbols.wallet,
                            weight: 200, // or whatever weight you want
                            size: 40,
                            color: Colors.black,
                          ),
                          // 2. Label (The text element)
                          label: const Text(
                            'Your wallet',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
