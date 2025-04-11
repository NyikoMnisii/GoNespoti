import 'package:flutter/material.dart';

class BookedRidesScreen extends StatelessWidget {
  // Sample data for booked rides
  final List<Map<String, String>> bookedRides = [
    {'destination': 'Nelspruit', 'departureTime': '10:00 AM', 'seats': '2', 'fare': '150.0'},
    {'destination': 'Polokwane', 'departureTime': '12:00 PM', 'seats': '3', 'fare': '200.0'},
    {'destination': 'Mbombela', 'departureTime': '2:00 PM', 'seats': '1', 'fare': '120.0'},
    {'destination': 'Tzaneen', 'departureTime': '4:00 PM', 'seats': '2', 'fare': '180.0'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booked Rides'),
        backgroundColor: Color(0xFF1E90FF),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: bookedRides.isEmpty
            ? Center(child: Text('You have no booked rides.'))
            : ListView.builder(
          itemCount: bookedRides.length,
          itemBuilder: (context, index) {
            var ride = bookedRides[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                leading: Icon(Icons.directions_car, size: 40, color: Color(0xFFFF5722)),
                title: Text('Ride to ${ride['destination']}'),
                subtitle: Text(
                    'Departs at ${ride['departureTime']}, ${ride['seats']} seats, Fare: \$${ride['fare']}'),
                trailing: Icon(Icons.arrow_forward_ios, color: Color(0xFFFF5722)),
                onTap: () {
                  // Navigate to the ride details page or show more details
                  // Here you could use something like RideDetailsScreen if needed
                  print('Booked Ride Clicked');
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
