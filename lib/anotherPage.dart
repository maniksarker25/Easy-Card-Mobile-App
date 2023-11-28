import 'package:flutter/material.dart';

class AnotherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Send Your Card",
          style: TextStyle(color: Colors.white), // Set app bar title text color
        ),
        backgroundColor: Colors.black, // Set app bar background color
        iconTheme: IconThemeData(color: Colors.white), // Set app bar icon color
      ),
      backgroundColor:
          Colors.black, // Set the background color for the entire page
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Add a SizedBox to create some space between app bar and text
          SizedBox(height: 16),
          // Add a ClipRRect to create rounded corners for the image
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                'https://i.ibb.co/sP5z7xR/mywiki.png',
                width: double.infinity,
                height: 300.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          // Add the additional text centered horizontally
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "Point your camera at the QR code to receive the card",
                style: TextStyle(
                    fontSize: 20, color: Colors.white), // Set text color
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 20), // Add some space before the button container
          // Container for buttons
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Example button 1 (Top and Bottom border radius) with margin-bottom
                Container(
                  margin: EdgeInsets.only(
                      bottom: 15), // Add margin-bottom for the first button
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Add your action here
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey, // Set button background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(8.0),
                          bottom: Radius.circular(8.0),
                        ), // Set button border radius
                      ),
                    ),
                    icon: Icon(Icons.share,
                        color: Colors.white), // Set icon color
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.start, // Align left
                      children: [
                        SizedBox(
                            width: 8), // Add some space between icon and text
                        Text('Share contact details',
                            style: TextStyle(
                                color: Colors.white)), // Set text color
                      ],
                    ),
                  ),
                ),
                // Example button 2 (Top border radius) with margin-bottom
                Container(
                  margin: EdgeInsets.only(
                      bottom: 3), // Add margin-bottom for the second button
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Add your action here
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey, // Set button background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8.0),
                          topLeft: Radius.circular(8.0),
                        ), // Set button border radius
                      ),
                    ),
                    icon:
                        Icon(Icons.copy, color: Colors.white), // Set icon color
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.start, // Align left
                      children: [
                        SizedBox(
                            width: 8), // Add some space between icon and text
                        Text('Copy link',
                            style: TextStyle(
                                color: Colors.white)), // Set text color
                      ],
                    ),
                  ),
                ),
                // Additional button 1 (Bottom border radius) with margin-bottom
                Container(
                  margin: EdgeInsets.only(
                      bottom: 3), // Add margin-bottom for the third button
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Add your action here
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey, // Set button background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, // No border radius
                      ),
                    ),
                    icon:
                        Icon(Icons.send, color: Colors.white), // Set icon color
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.start, // Align left
                      children: [
                        SizedBox(
                            width: 8), // Add some space between icon and text
                        Text('Send card another way',
                            style: TextStyle(
                                color: Colors.white)), // Set text color
                      ],
                    ),
                  ),
                ),
                // Additional button 2 (No border radius) with margin-bottom
                Container(
                  margin: EdgeInsets.only(
                      bottom: 3), // Add margin-bottom for the fourth button
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Add your action here
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey, // Set button background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, // No border radius
                      ),
                    ),
                    icon: Icon(Icons.qr_code,
                        color: Colors.white), // Set icon color
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.start, // Align left
                      children: [
                        SizedBox(
                            width: 8), // Add some space between icon and text
                        Text('Save QR code to photos',
                            style: TextStyle(
                                color: Colors.white)), // Set text color
                      ],
                    ),
                  ),
                ),
                // Additional button 3 (No border radius) with margin-bottom
                Container(
                  margin: EdgeInsets.only(
                      bottom: 3), // Add margin-bottom for the fifth button
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Add your action here
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey, // Set button background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, // No border radius
                      ),
                    ),
                    icon:
                        Icon(Icons.copy, color: Colors.white), // Set icon color
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.start, // Align left
                      children: [
                        SizedBox(
                            width: 8), // Add some space between icon and text
                        Text('Copy link with margin',
                            style: TextStyle(
                                color: Colors.white)), // Set text color
                      ],
                    ),
                  ),
                ),
                // Additional button 4 (No border radius) with margin-bottom
                Container(
                  margin: EdgeInsets.only(
                      bottom: 3), // Add margin-bottom for the sixth button
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Add your action here
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey, // Set button background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0),
                        ), // Set button border radius
                      ),
                    ),
                    icon: Icon(Icons.wallet,
                        color: Colors.white), // Set icon color
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.start, // Align left
                      children: [
                        SizedBox(
                            width: 8), // Add some space between icon and text
                        Text('Add card to wallet',
                            style: TextStyle(
                                color: Colors.white)), // Set text color
                      ],
                    ),
                  ),
                ),
                // Add more buttons as needed
                // add more
              ],
            ),
          ),
        ],
      ),
    );
  }
}
