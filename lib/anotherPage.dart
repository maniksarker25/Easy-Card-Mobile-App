import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:clipboard/clipboard.dart';
import 'package:share/share.dart';

class AnotherPage extends StatelessWidget {
  final Map<String, dynamic> profile;

  AnotherPage({required this.profile});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Send Your Card $profile",
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
            color: Colors.white, // Set the background color to white
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  QrImageView(
                    data:
                        'https://easycards.pro/${profile['setting']?['url'] ?? ''}',
                    version: QrVersions.auto,
                    size: 200.0,
                  ),
                  // Your widget content goes here
                ],
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
                    bottom: 3,
                  ),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      String link =
                          'https://tamastoria.pro/${profile['setting']?['url'] ?? ''}';

                      // Copy link to clipboard
                      FlutterClipboard.copy(link);

                      // Show a toast message
                      Fluttertoast.showToast(
                        msg: 'Link copied to clipboard!',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                      );

                      // Add your additional action here if needed
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8.0),
                          topLeft: Radius.circular(8.0),
                        ),
                      ),
                    ),
                    icon: Icon(Icons.copy, color: Colors.white),
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 8),
                        Text('Copy link',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                // Additional button 1 (Bottom border radius) with margin-bottom
                Container(
                  margin: EdgeInsets.only(bottom: 3),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Show bottom sheet with sharing options
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return ShareOptions();
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    icon: Icon(Icons.send, color: Colors.white),
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 8),
                        Text('Send card another way',
                            style: TextStyle(color: Colors.white)),
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

class ShareOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.facebook),
            title: Text('Share on Facebook'),
            onTap: () {
              // Share on Facebook
              Share.share('Check out this awesome content on Facebook!');
              Navigator.pop(context); // Close the bottom sheet
            },
          ),
          ListTile(
            leading: Icon(Icons.facebook),
            title: Text('Share on Twitter'),
            onTap: () {
              // Share on Twitter
              Share.share('Check out this awesome content on Twitter!');
              Navigator.pop(context); // Close the bottom sheet
            },
          ),
          ListTile(
            leading: Icon(Icons.link),
            title: Text('Copy Link'),
            onTap: () {
              // Copy Link
              Share.share('https://example.com');
              Navigator.pop(context); // Close the bottom sheet
            },
          ),
        ],
      ),
    );
  }
}

// another way ------------------

// import 'package:flutter/material.dart';
// import 'package:qr_flutter/qr_flutter.dart';

// class AnotherPage extends StatelessWidget {
//   final Map<String, dynamic> profile;

//   AnotherPage({required this.profile});
//   @override
//   Widget build(BuildContext context) {
//     // Your widget logic goes here

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Another Page'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             QrImageView(
//               data: '1234567890',
//               version: QrVersions.auto,
//               size: 200.0,
//             ),
//             // Your widget content goes here
//           ],
//         ),
//       ),
//       // Your additional widgets, navigation, etc., can be added here
//     );
//   }
// }
