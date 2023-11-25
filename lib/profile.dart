import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:typed_data';

class ProfileComponent extends StatelessWidget {
  final Map<String, dynamic> profile;

  // Receive the data as a parameter in the constructor
  const ProfileComponent({Key? key, required this.profile}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String image = profile['display']['ProfileImage'];
    // print('Image value: $image');
    bool isBase64 = image?.startsWith('data:image') ?? false;
    String displayType = profile['display']['design'];
    Widget contactInfo = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Information:',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Email: ',
        ),
      ],
    );

    if (displayType == "pro") {
      return Container(
        child: Padding(
          padding: EdgeInsets.zero, // Set padding to zero
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  // Handle button tap
                  print('Button tapped!');
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft:
                        Radius.circular(8.0), // Adjust border radius as needed
                    topRight: Radius.circular(8.0),
                  ),
                  child: Container(
                    height: 600.0,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.orange, // Set border color to orange
                          width: 40.0, // Set border width
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        isBase64
                            ? Image.memory(
                                // Display base64 image
                                _decodeBase64Image(image!),
                                width: double.infinity,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                // Display image from HTTP URL
                                image!,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                        SizedBox(
                            height:
                                10), // Add spacing between image and contact info
                        contactInfo,
                        SizedBox(
                            height: 10), // Add additional spacing if needed
                        // Add additional content or widgets specific to the "pro" case here
                        Text(
                          'Pro Information:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Add more widgets as needed for the "pro" case
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        child: Padding(
          padding: EdgeInsets.zero, // Set padding to zero
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  // Handle button tap
                  print('Button tapped!');
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft:
                        Radius.circular(8.0), // Adjust border radius as needed
                    topRight: Radius.circular(8.0),
                  ),
                  child: Container(
                    height: 600.0,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.orange, // Set border color to orange
                          width: 40.0, // Set border width
                        ),
                      ),
                    ),
                    child: isBase64
                        ? Image.memory(
                            // Display base64 image
                            _decodeBase64Image(image!),
                            width: double.infinity,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            // Display image from HTTP URL
                            image!,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}

// Function to decode base64 string to Uint8List
Uint8List _decodeBase64Image(String base64String) {
  Uint8List decodedBytes = base64Decode(
      base64String.replaceFirst(RegExp(r'data:image/[^;]+;base64,'), ''));
  return decodedBytes;
}
