import 'package:flutter/material.dart';
import 'routes/app_routes.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';

void main() {
  runApp(const FlutterAuthentication());
}

class FlutterAuthentication extends StatelessWidget {
  const FlutterAuthentication({super.key});

  @override
  Widget build(BuildContext context) {
    // final double widthSize = MediaQuery.of(context).size.width;
    // final double screenSize = widthSize * 0.75;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.login,
      routes: {
        AppRoutes.home: (context) => HomeScreen(),
        AppRoutes.login: (context) => LoginScreen(),
        AppRoutes.register: (context) => RegisterScreen(),
      },
    );
  }
}
