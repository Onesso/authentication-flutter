import 'package:authentication/screens/register_screen.dart';
import 'package:authentication/widgets/dialog/popup_when_can_not_athenticate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:authentication/widgets/dialog/loading_indicator_dialog.dart';
import 'package:flutter/services.dart';
import '../routes/app_routes.dart';
import 'package:authentication/services/local_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  bool? isChecked = true;
  bool isPasswordVisible = true;
  final _formKey = GlobalKey<FormState>();
  void _vibrateLightly() {
    HapticFeedback.lightImpact();
  }

  @override
  Widget build(BuildContext context) {
    final double widthSize = MediaQuery.of(context).size.width;
    final double screenSize = widthSize * 0.90;

    void navigateToDashboard(BuildContext context) {
      _vibrateLightly();
      Navigator.pushNamed(context, AppRoutes.dashboard);
    }

    return Form(
      key: _formKey,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Color(0xFFF7FFFE),
        appBar: AppBar(
          backgroundColor: Color(0xFFF7FFFE),
          // elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_outlined),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              //welcome information
              SizedBox(
                width: screenSize,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login Account",
                      style: TextStyle(
                        fontSize: 28,
                        fontFamily: 'Roboto',
                        color: const Color.fromARGB(255, 4, 142, 255),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.005,
                    ),
                    Text(
                      "Welcome Back!",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              Image.asset(
                "assets/images/loginimage.png",
                width: widthSize * 0.65,
              ),

              //userinput information
              SizedBox(
                width: screenSize,

                child: Container(
                  color: Color(0xFFF7FFFE),

                  // color: Color.fromARGB(255, 36, 160, 145),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email Address",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.height * 0.020,
                        ),
                      ),

                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'example@gmail.com',
                          hintStyle: TextStyle(color: Colors.grey),
                          suffixIcon: Icon(
                            color: Colors.blueAccent,
                            Icons.email,
                          ),
                          errorStyle: const TextStyle(fontSize: 14.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email address';
                          }
                          return null; // Return null if valid
                        },
                      ),

                      const SizedBox(height: 8),
                      Text(
                        "Password",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.height * 0.020,
                        ),
                      ),

                      TextFormField(
                        obscureText: isPasswordVisible,
                        decoration: InputDecoration(
                          hintText: 'enter password',
                          hintStyle: TextStyle(color: Colors.grey),
                          // suffixIcon: Icon(Icons.remove_red_eye_sharp),
                          suffixIcon: IconButton(
                            color: Colors.blueAccent,
                            onPressed: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                            icon: Icon(
                              !isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                          errorStyle: const TextStyle(fontSize: 14.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null; // Return null if valid
                        },
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Forget Password?",
                          style: TextStyle(
                            color: Colors.blue,
                          ), // optional styling
                        ),
                      ),

                      Row(
                        children: [
                          Checkbox(
                            tristate: true,
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value;
                              });
                            },
                          ),
                          Text("Remember me?"),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState?.validate() ?? false) {
                            showLoadingModal(context);

                            // Wait for 5 seconds
                            await Future.delayed(const Duration(seconds: 2));

                            if (!mounted) return;

                            dismissLoadingModal(context); // safer pop

                            navigateToDashboard(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(screenSize, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor: const Color.fromARGB(
                            255,
                            9,
                            91,
                            243,
                          ),
                          foregroundColor: Colors.white,
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    //or sign in with
                    SizedBox(
                      child: Row(
                        children: [
                          Expanded(child: Divider()), // expands to take space
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text('or sign in with'),
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),

                    //sign in with biometric
                    ElevatedButton(
                      onPressed: () async {
                        //check if phone support biometrics.
                        bool isDeviceCapable = await checkBiometrics();
                        if (isDeviceCapable) {
                          //authenticate user
                          logger.d(
                            "The devices is capable from the login screen",
                          );
                          bool isAuthenticated = await authenticateUser();
                          if (isAuthenticated) {
                            logger.d("User is authenticated");
                            navigateToDashboard(context);
                          } else {
                            logger.d("User is not authenticated");
                          }
                        } else {
                          phoneCanNotUseBiometrics(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(screenSize, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: const Color.fromARGB(255, 9, 91, 243),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Login with Biometric',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Don't have an account?  ",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          TextSpan(
                            text: "Sign Up",
                            style: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Navigate to Sign Up Screen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterScreen(),
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
