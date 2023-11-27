import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:typed_data';

class ProfileInfo extends StatelessWidget {
  final Map<String, dynamic> profile;

  // Receive the data as a parameter in the constructor
  const ProfileInfo({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String displayType = profile['display']['design'];
    String logo = profile['display']['Logo'];
    bool isBase64 = logo?.startsWith('data:image') ?? false;
    // bool isFlatDesign = displayType == 'flat';

    if (displayType == 'pro') {
      // Return a container for non-flat design
      return Container(
        margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
        height: 100.0,
        child: Center(
          child: isBase64
              ? Image.memory(
                  // Display base64 image
                  _decodeBase64Image(logo!),
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              : Image.network(
                  // Display image from HTTP URL
                  logo!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
        ),
      );
    } else {
      // Return a container for flat design
      String prefix = profile['profileInfo']['prefix'];
      String firstname = profile['profileInfo']['first_name'];
      String lastName = profile['profileInfo']['last_name'];
      String preferredName = profile['profileInfo']['preferred_name'];
      String suffix = profile['profileInfo']['suffix'];
      String jobTitle = profile['profileInfo']['job_title'];
      String logo = profile['display']['Logo'];
      bool isBase64 = logo?.startsWith('data:image') ?? false;

      return Container(
        margin: EdgeInsets.only(top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50.0),
              height: 80.0,
              width: double.infinity,
              child: isBase64
                  ? Image.memory(
                      // Display base64 image
                      _decodeBase64Image(logo!),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      // Display image from HTTP URL
                      logo!,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
            ),
            SizedBox(height: 10.0),
            Container(
              margin: EdgeInsets.only(left: 20.0), // Set left margin to 20px
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      "$prefix. $firstname $lastName",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold, // Make the text bold
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '$suffix ',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: '($preferredName)',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      "$jobTitle",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  // Add more Text widgets as needed
                ],
              ),
            ),
          ],
        ),
      );
    }
  }

  // Function to decode base64 string to Uint8List
  Uint8List _decodeBase64Image(String base64String) {
    Uint8List decodedBytes = base64Decode(
        base64String.replaceFirst(RegExp(r'data:image/[^;]+;base64,'), ''));
    return decodedBytes;
  }
}
