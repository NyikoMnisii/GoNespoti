import 'package:flutter/material.dart';
import 'package:ridesharing/screens/editProfile_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5), // Clean white background for a minimalist look
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(fontWeight: FontWeight.bold)), // Bold font for the title
        backgroundColor: Color(0xFF1E90FF), // Using Teal for consistency with the minimalistic branding
        elevation: 0, // Flat app bar for a clean look
      ),
      body: Center( // Center the entire body content
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centering column vertically
            crossAxisAlignment: CrossAxisAlignment.center, // Centering column horizontally
            children: [
              // Profile Picture Section
              CircleAvatar(
                radius: 60,  // Larger avatar for a more prominent profile picture
                backgroundImage: NetworkImage('https://www.example.com/profile.jpg'),
                backgroundColor: Color(0xFFF5F5F5), // Light background for a clean look
              ),
              SizedBox(height: 20),
              // Name Section
              Text(
                'John Doe',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600, // Slightly bold for the name
                  color: Color(0xFF333333),
                ),
              ),
              SizedBox(height: 5),
              // Email Section
              Text(
                'johndoe@example.com',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300, // Lighter weight for the email text
                  color: Color(0xFF333333), // Subtle color for less emphasis
                ),
              ),
              SizedBox(height: 30),
              // Edit Profile Button
              ElevatedButton(
                onPressed: () {
                  // Functionality for editing profile (e.g., navigate to another screen)
                  print("Edit Profile");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfileScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF5722), // Consistent with app branding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded corners for button
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  elevation: 5, // Slight elevation for depth
                ),
                child: Text(
                  "Edit Profile",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Verify ID Button
              ElevatedButton(
                onPressed: () {
                  // Placeholder for ID verification logic
                  print("Verify ID");
                  // Implement logic for ID verification
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF5722), // Consistent with app branding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded corners for button
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  elevation: 5, // Slight elevation for depth
                ),
                child: Text(
                  "Verify ID",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Verify Facebook Account Button
              ElevatedButton(
                onPressed: () {
                  // Placeholder for Facebook verification logic
                  print("Verify Facebook Account");
                  // Implement logic for Facebook verification
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF5722), // Consistent with app branding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded corners for button
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  elevation: 5, // Slight elevation for depth
                ),
                child: Text(
                  "Verify Facebook Account",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Confirm Email Button
              ElevatedButton(
                onPressed: () {
                  // Placeholder for Email confirmation logic
                  print("Confirm Email");
                  // Implement logic for email confirmation
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF5722), // Consistent with app branding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded corners for button
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  elevation: 5, // Slight elevation for depth
                ),
                child: Text(
                  "Confirm Email",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
