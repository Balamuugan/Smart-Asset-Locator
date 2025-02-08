// login_signup.dart

import 'package:flutter/material.dart';

class LoginSignupPage extends StatefulWidget {
  const LoginSignupPage({super.key});

  @override
  _LoginSignupPageState createState() => _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.blueGrey[300],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        title: const Text(
          'Login Form',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: screenWidth * 0.85,
          padding: EdgeInsets.all(screenWidth * 0.06),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildToggleButton('Login', isLogin, screenWidth, true),
                  _buildToggleButton('Signup', !isLogin, screenWidth, false),
                ],
              ),
              SizedBox(height: screenWidth * 0.05),
              if (!isLogin)
                _buildTextField('Name', screenWidth),
              if (!isLogin) SizedBox(height: screenWidth * 0.025),
              _buildTextField('Email Address', screenWidth),
              SizedBox(height: screenWidth * 0.025),
              _buildTextField('Password', screenWidth, isPassword: true),
              if (!isLogin) SizedBox(height: screenWidth * 0.025),
              if (!isLogin)
                _buildTextField('Confirm Password', screenWidth, isPassword: true),
              SizedBox(height: screenWidth * 0.05),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  padding: EdgeInsets.symmetric(
                      vertical: screenWidth * 0.04),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  isLogin ? 'Login' : 'Signup',
                  style: TextStyle(
                      fontSize: screenWidth * 0.045, color: Colors.white),
                ),
              ),
              SizedBox(height: screenWidth * 0.05),
              if (isLogin)
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ),
              if (isLogin)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Not a member?"),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isLogin = false;
                        });
                      },
                      child: const Text(
                        'Signup now',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton _buildToggleButton(
      String text, bool isActive, double screenWidth, bool login) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isActive ? Colors.blueGrey : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(login ? 20 : 0),
              right: Radius.circular(login ? 0 : 20)),
        ),
      ),
      onPressed: () {
        setState(() {
          isLogin = login;
        });
      },
      child: Text(
        text,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.blueGrey,
          fontWeight: FontWeight.bold,
          fontSize: screenWidth * 0.04,
        ),
      ),
    );
  }

  TextField _buildTextField(String labelText, double screenWidth,
      {bool isPassword = false}) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.02),
        ),
      ),
      obscureText: isPassword,
    );
  }
}
