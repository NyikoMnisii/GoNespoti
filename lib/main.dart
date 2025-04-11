import 'package:flutter/material.dart';
import 'package:ridesharing/firebase_options.dart';
import 'package:ridesharing/screens/BookedRidesScreen.dart';
import 'package:ridesharing/screens/ChatScreen.dart';
import 'package:ridesharing/screens/Ride_details.dart';
import 'package:ridesharing/screens/postride_screen.dart';
import 'package:ridesharing/screens/SignUpScreen.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();  // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Assuming that these values will be dynamically passed or set somewhere
  final String rideId = '123';
  final String driverName = 'John Doe';
  final String driverImageUrl = 'https://example.com/driver_image.jpg';
  final String carImageUrl = 'https://example.com/car_image.jpg';
  final String destination = 'Nelspruit';
  final DateTime departureTime = DateTime.now();
  final int seatsAvailable = 3;
  final double fare = 50.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoNelspruit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/home': (context) => HomeScreen(),
        '/profile': (context) => ProfileScreen(),
        '/postRide': (context) => PostRideScreen(),
        '/rideDetails': (context) => RideDetailsScreen(
          rideId: rideId,
          driverName: driverName,
          driverImageUrl: driverImageUrl,
          carImageUrl: carImageUrl,
          destination: destination,
          departureTime: departureTime,
          seatsAvailable: seatsAvailable,
          fare: fare,
        ),
        '/chat': (context) => ChatScreen(),
        '/BookedRide': (context) => BookedRidesScreen(),
      },
    );
  }
}
