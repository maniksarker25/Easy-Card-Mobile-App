import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          SizedBox(height: 50), // Margin top 50px
          Center(
            child: Text(
              'EasyCards',
              style: TextStyle(
                fontSize: 50, // Font size 50px
                // You can add more styles here if needed
              ),
            ),
          ),
          SizedBox(
              height: 20), // Additional space between EasyCards and user info

          // User information
          ListTile(
            contentPadding:
                EdgeInsets.only(left: 10), // Margin from the left edge
            leading: CircleAvatar(
              // Replace with your image
              backgroundImage: NetworkImage(
                  'https://i.ibb.co/brB2TfT/360-F-364211147-1qg-LVxv1-Tcq0-Ohz3-Faw-Ufrt-ONzz8nq3e.jpg'),
              radius: 25, // Adjust the radius as needed
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'John Doe', // Replace with user's name
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'manik@example.com', // Replace with user's email
                ),
              ],
            ),
          ),

          // Button Container
          Container(
            margin:
                EdgeInsets.only(left: 10, top: 100), // Margin from left and top
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildButton(Icons.phone, 'Get in touch'),
                SizedBox(height: 20), // Space between buttons
                _buildButton(Icons.description, 'Terms & Conditions'),
                SizedBox(height: 20), // Space between buttons
                _buildButton(Icons.exit_to_app, 'Sign out'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 20), // Space between icon and text
        Text(text),
      ],
    );
  }
}
