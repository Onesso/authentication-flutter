import 'package:flutter/material.dart';
// import 'dart:ui';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final double widthSize = MediaQuery.of(context).size.width;
    final double screenSize = widthSize * 0.90;

    final double totalHeight = MediaQuery.of(context).size.height;

    final double appBarHeight = AppBar().preferredSize.height;

    final double statusBarHeight = MediaQuery.of(context).padding.top;

    final double remainingHeight = totalHeight - appBarHeight - statusBarHeight;

    // final double sectionHeight = remainingHeight / 5;
    final double sectionHeight = (remainingHeight / 5).clamp(
      0,
      double.infinity,
    );

    final formKey = GlobalKey<FormState>();

    return Scaffold(
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

        // flexibleSpace: ClipRRect(
        //   child: BackdropFilter(
        //     filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
        //     child: Container(color: Color(0xFFF7FFFE).withValues(alpha: 0.8)),
        //   ),
        // ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: screenSize,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: sectionHeight,
                  width: widthSize,
                  child: Container(
                    color: Color(0xFFF7FFFE),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Login Account",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.04,
                            fontFamily: 'Roboto',
                            color: const Color.fromARGB(255, 4, 142, 255),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          "Welcome Back",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.height * 0.02,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: sectionHeight * 2,
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        // Username Field
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Username',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your username';
                            }
                            return null; // Return null if valid
                          },
                        ),
                        const SizedBox(height: 16.0),

                        // Password Field
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null; // Return null if valid
                          },
                        ),
                        const SizedBox(height: 16.0),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: sectionHeight * 2,
                  child: Container(color: Colors.green),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
