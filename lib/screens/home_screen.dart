import 'package:flutter/material.dart';
import 'package:ridesharing/screens/BookedRidesScreen.dart';
import 'package:ridesharing/screens/ChatScreen.dart';
import 'package:ridesharing/screens/Ride_details.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Sample data for available rides
  List<Map<String, String>> rides = [
    {'destination': 'Nelspruit', 'departureTime': '10:00 AM', 'seats': '4'},
    {'destination': 'Polokwane', 'departureTime': '12:00 PM', 'seats': '3'},
    {'destination': 'Mbombela', 'departureTime': '2:00 PM', 'seats': '2'},
    {'destination': 'Tzaneen', 'departureTime': '4:00 PM', 'seats': '5'},
  ];

  // Search controller to capture input
  TextEditingController searchController = TextEditingController();

  // List to hold filtered rides based on the search query
  late List<Map<String, String>> filteredRides;

  // Filter options
  String selectedTimeFilter = 'Any time';
  String selectedSeatsFilter = 'Any seats';

  @override
  void initState() {
    super.initState();
    filteredRides = rides; // Initially, show all rides
  }

  // Filter rides based on the search query and selected filters
  void filterRides(String query) {
    setState(() {
      filteredRides = rides.where((ride) {
        bool matchesQuery = ride['destination']!.toLowerCase().contains(query.toLowerCase()) ||
            ride['departureTime']!.toLowerCase().contains(query.toLowerCase()) ||
            ride['seats']!.toLowerCase().contains(query.toLowerCase());

        // Apply time filter if it's not 'Any time'
        bool matchesTimeFilter = selectedTimeFilter == 'Any time' || ride['departureTime'] == selectedTimeFilter;

        // Apply seats filter if it's not 'Any seats'
        bool matchesSeatsFilter = selectedSeatsFilter == 'Any seats' || ride['seats'] == selectedSeatsFilter;

        return matchesQuery && matchesTimeFilter && matchesSeatsFilter;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GoNelspruit'),
        backgroundColor: Color(0xFF1E90FF),
        elevation: 0,
      ),
      body: SingleChildScrollView(  // Wrap the entire body with SingleChildScrollView
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Welcome, John Doe!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
                ),
                IconButton(
                  icon: Icon(Icons.account_circle, size: 30, color: Color(0xFFFF5722)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                ),
              ],
            ),
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: TextField(
                controller: searchController,
                onChanged: filterRides,
                decoration: InputDecoration(
                  labelText: 'Search for rides...',
                  prefixIcon: Icon(Icons.search, color: Color(0xFFFF5722)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xFF1E90FF)),
                  ),
                  filled: true,
                  fillColor: Color(0xFFF5F5F5),
                ),
              ),
            ),
            // Filter Options
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Time Filter
                DropdownButton<String>(
                  value: selectedTimeFilter,
                  onChanged: (value) {
                    setState(() {
                      selectedTimeFilter = value!;
                      filterRides(searchController.text); // Reapply the filter after selection
                    });
                  },
                  items: ['Any time', '10:00 AM', '12:00 PM', '2:00 PM', '4:00 PM']
                      .map((time) => DropdownMenuItem(
                    value: time,
                    child: Text(time),
                  ))
                      .toList(),
                ),
                // Seats Filter
                DropdownButton<String>(
                  value: selectedSeatsFilter,
                  onChanged: (value) {
                    setState(() {
                      selectedSeatsFilter = value!;
                      filterRides(searchController.text); // Reapply the filter after selection
                    });
                  },
                  items: ['Any seats', '2', '3', '4', '5']
                      .map((seats) => DropdownMenuItem(
                    value: seats,
                    child: Text(seats),
                  ))
                      .toList(),
                ),
              ],
            ),
            // Available Rides Section
            ListView.builder(
              shrinkWrap: true,  // Use shrinkWrap to make the ListView scrollable within its parent
              itemCount: filteredRides.length,
              itemBuilder: (context, index) {
                var ride = filteredRides[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16),
                    leading: Icon(Icons.directions_car, size: 40, color: Color(0xFFFF5722)),
                    title: Text('Ride to ${ride['destination']}', style: TextStyle(fontSize: 16)),
                    subtitle: Text('Departs at ${ride['departureTime']}, ${ride['seats']} seats available', style: TextStyle(fontSize: 14)),
                    trailing: Icon(Icons.arrow_forward_ios, color: Color(0xFFFF5722)),
                    onTap: () {
                      // Log the message before navigation
                      print('Ride clicked');

                      // Navigate to the RideDetailsScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RideDetailsScreen(
                            rideId: '123',
                            driverName: 'John Doe',
                            driverImageUrl: 'https://www.example.com/driver_profile.jpg',
                            carImageUrl: 'https://www.example.com/car_image.jpg',
                            destination: 'Nelspruit',
                            departureTime: '10:00 AM',
                            seatsAvailable: 3,
                            fare: 150.0,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the screen where users can post a ride
          Navigator.pushNamed(context, '/postRide');
        },
        backgroundColor: Color(0xFFFF5722),
        child: Icon(Icons.add, size: 30,color: Color(0xFFF5F5F5)),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF1E90FF),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,  // Adjusted to space evenly to prevent overflow
          children: [
            // Chat Button with label
            Column(
              mainAxisSize: MainAxisSize.min,  // Ensures the Column only takes the necessary space
              children: [
                IconButton(
                  icon: Icon(Icons.chat, color: Color(0xFFFF5722)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(), // Navigate to the chat screen
                      ),
                    );
                  },
                ),
                Text(
                  'Chat',
                  style: TextStyle(color: Color(0xFF333333), fontSize: 12),
                ),
              ],
            ),
            // Booked Rides Button with label
            Column(
              mainAxisSize: MainAxisSize.min,  // Ensures the Column only takes the necessary space
              children: [
                IconButton(
                  icon: Icon(Icons.car_rental_rounded, color: Color(0xFFFF5722)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookedRidesScreen(), // Navigate to the booked rides screen
                      ),
                    );
                  },
                ),
                Text(
                  'Booked Rides',
                  style: TextStyle(color: Color(0xFF333333), fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
