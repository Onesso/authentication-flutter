import 'package:flutter/material.dart';
import 'package:authentication/widgets/buttons/button_custom.dart';
import 'package:logger/logger.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Logger logger = Logger();

  void _vibrateLightly() {
    HapticFeedback.lightImpact();
  }

  void rollDiceFunction() {
    logger.d("button clicked");
    _vibrateLightly();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double textWidth = screenWidth * 0.80;

    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(backgroundColor: Colors.black, toolbarHeight: 1.0),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assests/images/Illustration.png",
                  width: textWidth,
                ),
                Text(
                  'Welcome to TrustFund',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.05,
                    color: Colors.deepPurple,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: textWidth + 5, // set your desired width
                  child: Text(
                    'the harbor beneath the horizon, a lantern cast choing off obsidian rocks near the summit, leaving only ripples of velvet drift in the quartz night.',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),

                Column(
                  children: [
                    CustomeButton(
                      "Login",
                      backgroundColor: Colors.green,
                      onPressed: rollDiceFunction,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    CustomeButton("Register", onPressed: rollDiceFunction),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// const String assetName = 'assets/dart.svg';
// final Widget svg = SvgPicture.asset(assetName, semanticsLabel: 'Dart Logo');