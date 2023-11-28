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
    String prefix = profile['profileInfo']['prefix'];
    String firstName = profile['profileInfo']['first_name'];
    String lastName = profile['profileInfo']['last_name'];
    String preferredName = profile['profileInfo']['preferred_name'];
    String department = profile['profileInfo']['department'];
    String company = profile['profileInfo']['company'];
    String suffix = profile['profileInfo']['suffix'];
    String jobTitle = profile['profileInfo']['job_title'];
    // print('Image value: $image');
    bool isBase64Image = image?.startsWith('data:image') ?? false;
    String logo = profile['display']['Logo'];
    bool isBase64Logo = logo?.startsWith('data:image') ?? false;
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
          padding: EdgeInsets.zero,
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  // Handle button tap
                  print('Button tapped!');
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        isBase64Image
                            ? Image.memory(
                                _decodeBase64Image(image!),
                                width: double.infinity,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                image!,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                        SizedBox(height: 0),
                        Container(
                          color: Colors.blue,
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '$prefix. $firstName $lastName',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.center,
                                    ),
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '$suffix ',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '($preferredName)',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Padding(
                                      padding: EdgeInsets.only(top: 0),
                                      child: Text(
                                        '$jobTitle',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Text(
                                      "$department",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      "$company",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
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
                    child: isBase64Image
                        ? Image.memory(
                            // Display base64 image
                            _decodeBase64Image(image!),
                            width: double.infinity,
                            height: 100,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            // Display image from HTTP URL
                            image!,
                            width: double.infinity,
                            height: 100,
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
