import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // To format the date and time

class PostRideScreen extends StatefulWidget {
  @override
  _PostRideScreenState createState() => _PostRideScreenState();
}

class _PostRideScreenState extends State<PostRideScreen> {
  // Form key for validation
  final _formKey = GlobalKey<FormState>();

  // Controllers for the form fields
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _departureTimeController = TextEditingController();
  final TextEditingController _fareController = TextEditingController();

  // Variables for selected date, time and seats
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  int _selectedSeats = 1;

  // List of available seat options
  final List<int> _seatOptions = [1, 2, 3, 4, 5, 6, 7, 8];

  // Function to pick date
  Future<void> _pickDate() async {
    DateTime initialDate = DateTime.now();
    DateTime firstDate = DateTime(2000);
    DateTime lastDate = DateTime(2100);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _departureTimeController.text = DateFormat.yMd().format(_selectedDate!);
      });
    }
  }

  // Function to pick time
  Future<void> _pickTime() async {
    TimeOfDay initialTime = TimeOfDay.now();

    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? initialTime,
    );

    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
        _departureTimeController.text += ' ${_selectedTime!.format(context)}';
      });
    }
  }

  // Submit the ride details
  void _submitRide() {
    if (_formKey.currentState?.validate() ?? false) {
      // Normally here you would send the data to the backend (Firestore or other)
      print("Ride Posted:");
      print("Destination: ${_destinationController.text}");
      print("Departure Time: ${_departureTimeController.text}");
      print("Seats Available: $_selectedSeats");
      print("Fare: ${_fareController.text}");
      // On success, navigate to another screen or show a success message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Ride Posted Successfully!')));
      // You can clear the form fields or navigate away after posting the ride
      _destinationController.clear();
      _departureTimeController.clear();
      _fareController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post a Ride'),
        backgroundColor: Color(0xFF1E90FF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Destination input field
              TextFormField(
                controller: _destinationController,
                decoration: InputDecoration(
                  labelText: 'Destination',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a destination';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Departure time input field (combined date and time)
              TextFormField(
                controller: _departureTimeController,
                decoration: InputDecoration(
                  labelText: 'Departure Time',
                  hintText: 'Select Date & Time',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a departure time';
                  }
                  return null;
                },
                onTap: () async {
                  // Disable the text field from direct editing
                  FocusScope.of(context).requestFocus(FocusNode());
                  await _pickDate();
                  await _pickTime();
                },
              ),
              SizedBox(height: 16),

              // Dropdown for number of seats
              DropdownButtonFormField<int>(
                value: _selectedSeats,
                decoration: InputDecoration(
                  labelText: 'Seats Available',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _selectedSeats = value!;
                  });
                },
                items: _seatOptions.map((int seats) {
                  return DropdownMenuItem<int>(
                    value: seats,
                    child: Text('$seats seats'),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null || value <= 0) {
                    return 'Please select the number of seats';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Fare input field
              TextFormField(
                controller: _fareController,
                decoration: InputDecoration(
                  labelText: 'Fare',
                  hintText: 'e.g., 150 ZAR',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the fare';
                  } else if (double.tryParse(value) == null || double.parse(value) <= 0) {
                    return 'Please enter a valid fare';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32),

              // Submit button
              Center(
                child: ElevatedButton(
                  onPressed: _submitRide,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFF5722),
                    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Post Ride', style: TextStyle(fontSize: 18, color:Color(
                      0xFF333333))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
