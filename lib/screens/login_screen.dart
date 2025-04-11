
import 'package:flutter/material.dart';
import 'package:ridesharing/componets/Input/SingleLineInputField.dart';
import 'package:ridesharing/componets/buttons/loginbutton.dart';



class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controllers for text fields
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5), // Clean minimalist background
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Color(0xFF1E90FF), // Deep Purple (Brand Color)
        centerTitle: true,
        elevation: 0, // Flat minimalistic design
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo Image
            Image.asset(
              'assets/Logo.png', // Make sure you have the correct logo file in your 'assets' folder
              width: 150, // You can adjust the size of the logo
              height: 150,
            ),
            SizedBox(height: 40),

            // Engaging message at the top
            Text(
              "Welcome back to GoNespoti! 🚗\n"
                  "Safe & Reliable rides at your fingertips.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333), // Dark Cyan (Brand Color)
                height: 1.5,
              ),
            ),
            SizedBox(height: 40),

            // Email Input Field
            SingleLineInputField(
              hintText: 'Enter your email',
              controller: emailController,
              icon: Icons.email,
            ),
            SizedBox(height: 20),

            // Password Input Field
            SingleLineInputField(
              hintText: 'Enter your password',
              controller: passwordController,
              icon: Icons.lock,
              obscureText: true,
            ),
            SizedBox(height: 10),

            // Forgot Password
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  print("Redirect to Forgot Password page");
                },
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF333333), // Deep Purple
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),

            // Login Button
            LoginButton(
              text: 'Sign in',
              textColor: Color(0xFF333333),
              backgroundColor: Color(0xFFFF5722), // Golden Yellow (Brand Color)
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
                print('Email: ${emailController.text}');
                print('Password: ${passwordController.text}');
              },
            ),

            SizedBox(height: 20),

            // Signup Link
            GestureDetector(
              onTap: ( ) {
                Navigator.pushReplacementNamed(context, '/signup');

                print("Redirect to Sign-Up page");
              },
              child: Text(
                "Don't have an account? Sign up",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFFFF5722), // Deep Purple (Brand Color)
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
