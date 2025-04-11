import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // List of messages (you can replace this with dynamic data in a real app)
  List<Map<String, String>> messages = [
    {'sender': 'Driver', 'message': 'Hi! How can I assist you?'},
    {'sender': 'User', 'message': 'Hi, I need some help with my ride.'},
    {'sender': 'Driver', 'message': 'Sure, what do you need?'},
  ];

  // Controller for the message input field
  final TextEditingController _messageController = TextEditingController();

  // Function to send a message
  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        messages.add({'sender': 'User', 'message': _messageController.text});
      });
      _messageController.clear(); // Clear the input field
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat with Driver"),
        backgroundColor: Color(0xFF1E90FF),
      ),
      body: Column(
        children: [
          // Chat Messages List
          Expanded(
            child: ListView.builder(
              reverse: true, // To show the latest message at the bottom
              itemCount: messages.length,
              itemBuilder: (context, index) {
                var message = messages[index];
                bool isUser = message['sender'] == 'User';
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment:
                    isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        color: isUser ? Color(0xFF1E90FF) : Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        message['message']!,
                        style: TextStyle(
                          color: isUser ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Message Input Field and Send Button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Color(0xFFFF5722)),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
