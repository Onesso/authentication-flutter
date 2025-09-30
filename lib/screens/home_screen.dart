import 'package:flutter/material.dart';
import 'package:authentication/widgets/buttons/button_custom.dart';
import 'package:logger/logger.dart';
import 'package:flutter/services.dart';
import '../routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Logger logger = Logger();

  void _vibrateLightly() {
    HapticFeedback.lightImpact();
  }

  void navigateToLogin(BuildContext context) {
    logger.d("button clicked");
    _vibrateLightly();
    Navigator.pushNamed(context, AppRoutes.login);
  }

  void navigateToRegister(BuildContext context) {
    logger.d("button clicked");
    _vibrateLightly();
    Navigator.pushNamed(context, AppRoutes.register);
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double textWidth = screenWidth * 0.80;

    return Scaffold(
      backgroundColor: Color(0xFFF7FFFE),
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.white10, toolbarHeight: 1.0),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/Illustration.png", width: textWidth),
              Text(
                'Welcome to TrustFund',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.05,
                  fontFamily: 'Roboto',
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.005),
              SizedBox(
                width: textWidth + 5, // set your desired width
                child: Text(
                  'the harbor beneath the horizon, a lantern cast choing off obsidian rocks near the summit, leaving only ripples of velvet drift in the quartz night.',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.08),

              Column(
                children: [
                  CustomeButton(
                    "Login",
                    backgroundColor: const Color.fromARGB(255, 9, 91, 243),
                    onPressed: () => navigateToLogin(context),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  CustomeButton(
                    "Register",
                    backgroundColor: const Color.fromARGB(255, 76, 189, 255),
                    foregroundColor: Colors.black,
                    onPressed: () => navigateToRegister(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
