import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:authentication/screens/login_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:authentication/widgets/dialog/loading_indicator_dialog.dart';
import 'package:flutter/services.dart';
import '../routes/app_routes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() {
    return _RegisterScreen();
  }
}

class _RegisterScreen extends State<RegisterScreen> {
  bool? isChecked = false;
  bool isPasswordVisible = true;
  final _formKey = GlobalKey<FormState>();
  void _vibrateLightly() {
    HapticFeedback.lightImpact();
  }

  // Controllers for text fields
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double widthSize = MediaQuery.of(context).size.width;
    final double screenSize = widthSize * 0.90;

    void navigateToLogin(BuildContext context) {
      _vibrateLightly();
      Navigator.pushNamed(context, AppRoutes.login);
    }

    return Form(
      key: _formKey,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color(0xFFF7FFFE),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF7FFFE),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_outlined),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: widthSize * 0.05,
            ), // Use padding instead of SizedBox for width
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.04,
                    fontFamily: 'Roboto',
                    color: const Color.fromARGB(255, 4, 142, 255),
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Sign up to continue",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                  ),
                ),
                const SizedBox(height: 12),

                Text(
                  "Email Address",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.height * 0.020,
                  ),
                ),
                const SizedBox(height: 2),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Enter email address',
                    hintStyle: const TextStyle(color: Colors.grey),
                    suffixIcon: const Icon(
                      Icons.email,
                      color: Color.fromARGB(255, 65, 120, 214),
                    ),
                    errorStyle: const TextStyle(fontSize: 14.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),

                Text(
                  "Password",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.height * 0.020,
                  ),
                ),
                const SizedBox(height: 2),
                TextFormField(
                  controller: _passwordController,
                  obscureText: isPasswordVisible,
                  decoration: InputDecoration(
                    hintText: 'Create password',
                    hintStyle: const TextStyle(color: Colors.grey),
                    suffixIcon: IconButton(
                      color: const Color.fromARGB(255, 65, 120, 214),
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
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),

                Text(
                  "Confirm Password",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.height * 0.020,
                  ),
                ),
                const SizedBox(height: 2),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: isPasswordVisible,
                  decoration: InputDecoration(
                    hintText: 'Re-enter password',
                    hintStyle: const TextStyle(color: Colors.grey),
                    suffixIcon: IconButton(
                      color: const Color.fromARGB(255, 65, 120, 214),
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
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please re-enter your password';
                    } else if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 2),

                Row(
                  children: [
                    Checkbox(
                      tristate: false,
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value;
                        });
                      },
                    ),
                    const Text("I agree with privacy policy"),
                  ],
                ),
                const SizedBox(height: 2),

                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      showLoadingModal(context);

                      // Wait for 5 seconds
                      await Future.delayed(const Duration(seconds: 2));

                      if (!mounted) return;

                      dismissLoadingModal(context);

                      navigateToLogin(context);
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
                    'Sign up',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text('or sign in with'),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 7),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 221, 232, 241),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(24),
                        alignment: Alignment.center,
                        child: const FaIcon(
                          FontAwesomeIcons.google,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 7),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 221, 232, 241),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(24),
                        alignment: Alignment.center,
                        child: const FaIcon(
                          FontAwesomeIcons.apple,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 7),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 221, 232, 241),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(24),
                        alignment: Alignment.center,
                        child: const FaIcon(
                          FontAwesomeIcons.facebook,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "Already have an account?  ",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "Log in",
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
