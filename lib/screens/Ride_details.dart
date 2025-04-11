import 'package:flutter/material.dart';

class RideDetailsScreen extends StatelessWidget {
  final String rideId; // Unique identifier for the ride
  final String driverName;
  final String driverImageUrl; // URL for driver's profile image
  final String carImageUrl; // URL for car image
  final String destination;
  final  departureTime;
  final int seatsAvailable;
  final double fare;

  // Constructor to accept the ride details when navigating to this screen
  RideDetailsScreen({
    required this.rideId,
    required this.driverName,
    required this.driverImageUrl,
    required this.carImageUrl,
    required this.destination,
    required this.departureTime,
    required this.seatsAvailable,
    required this.fare,
  });

  // Booking function to simulate booking action
  void _bookRide(BuildContext context) {
    // Normally, this would involve sending booking data to the backend
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Booking Confirmation'),
        content: Text('You have successfully booked a ride to $destination.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ride Details'),
        backgroundColor: Color(0xFF1E90FF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Driver Info
            Row(
              children: [
                // Driver's Profile Image
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(driverImageUrl), // Driver's image URL
                ),
                SizedBox(width: 16),
                Text(
                  'Driver: $driverName',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Car Image
            Center(
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(carImageUrl), // Car's image URL
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Ride Information
            Text(
              'Destination: $destination',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Departure Time: $departureTime',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Seats Available: $seatsAvailable',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Fare: \$${fare.toStringAsFixed(2)}', // Format fare with 2 decimal places
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),

            // Book Ride Button
            Center(
              child: ElevatedButton(
                onPressed: () => _bookRide(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor:Color(0xFFFF5722),
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Book Ride',
                  style: TextStyle(fontSize: 18, color: Color(0xFF333333)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
