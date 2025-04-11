import 'package:flutter/material.dart';
import 'package:ridesharing/componets/Input/SingleLineInputField.dart';
import 'package:ridesharing/componets/buttons/loginbutton.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController carModelController = TextEditingController();  // For Driver
  TextEditingController carPlateController = TextEditingController();   // For Driver
  TextEditingController driverIdController = TextEditingController();   // For Driver ID number

  String userRole = 'Passenger'; // Default role is Passenger

  @override
  void dispose() {
    // Clean up controllers
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    carModelController.dispose();
    carPlateController.dispose();
    driverIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text('Sign Up'),
        backgroundColor: Color(0xFF1E90FF),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView( // Wrap the body in a SingleChildScrollView
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo
            Image.asset(
              'assets/Logo.png',
              width: 150,
              height: 150,
            ),
            SizedBox(height: 40),

            // Welcome message
            Text(
              "Create your account\nLet’s get you started!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
                height: 1.5,
              ),
            ),
            SizedBox(height: 40),

            // Role Selector (Driver / Passenger)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChoiceChip(
                  label: Text('Passenger'),
                  selected: userRole == 'Passenger',
                  onSelected: (selected) {
                    setState(() {
                      userRole = 'Passenger';
                    });
                  },
                ),
                SizedBox(width: 10),
                ChoiceChip(
                  label: Text('Driver'),
                  selected: userRole == 'Driver',
                  onSelected: (selected) {
                    setState(() {
                      userRole = 'Driver';
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 40),

            // Name Input Field
            SingleLineInputField(
              hintText: 'Enter your name',
              controller: nameController,
              icon: Icons.person,
            ),
            SizedBox(height: 20),

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
            SizedBox(height: 20),

            // Phone Input Field
            SingleLineInputField(
              hintText: 'Enter your phone number',
              controller: phoneController,
              icon: Icons.phone,
            ),
            SizedBox(height: 20),

            // Additional fields based on role
            if (userRole == 'Driver') ...[
              // Car Model Input Field (Driver-specific)
              SingleLineInputField(
                hintText: 'Enter your car model',
                controller: carModelController,
                icon: Icons.directions_car,
              ),
              SizedBox(height: 20),

              // Car Plate Input Field (Driver-specific)
              SingleLineInputField(
                hintText: 'Enter your car plate number',
                controller: carPlateController,
                icon: Icons.car_repair,
              ),
              SizedBox(height: 20),

              // Driver ID Number Input Field (Driver-specific)
              SingleLineInputField(
                hintText: 'Enter your driver ID number',
                controller: driverIdController,
                icon: Icons.card_membership, // This icon could represent an ID card
              ),
            ],

            SizedBox(height: 40),

            // Sign-Up Button
            LoginButton(
              text: 'Sign Up',
              textColor: Color(0xFF333333),
              backgroundColor: Color(0xFFFF5722),
              onPressed: () {
                print('Name: ${nameController.text}');
                print('Email: ${emailController.text}');
                print('Password: ${passwordController.text}');
                print('Phone: ${phoneController.text}');

                if (userRole == 'Driver') {
                  print('Car Model: ${carModelController.text}');
                  print('Car Plate: ${carPlateController.text}');
                  print('Driver ID: ${driverIdController.text}'); // New ID field for driver
                }

                // Here you can navigate to a different screen or handle the signup logic
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),

            SizedBox(height: 20),

            // Login Link
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: Text(
                "Already have an account? Log in",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFFFF5722),
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
