import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  final Map<String, dynamic> profile;

  // Receive the data as a parameter in the constructor
  const ProfileInfo({Key? key, required this.profile}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String prefix = profile['profileInfo']['prefix'];
    String firstname = profile['profileInfo']['first_name'];
    String lastName = profile['profileInfo']['last_name'];
    String preferredName = profile['profileInfo']['preferred_name'];
    String suffix = profile['profileInfo']['suffix'];
    String jobTitle = profile['profileInfo']['job_title'];
    String logo = profile['display']['Logo'];
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50.0),
            height: 80.0,
            width: double.infinity,
            child: Image.network(
              "$logo", // Replace with your image URL or use AssetImage for local assets
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
                  child: Text(
                    "$suffix ($preferredName)",
                    style:
                        TextStyle(fontSize: 25.0), // Adjust font size as needed
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    "$jobTitle",
                    style:
                        TextStyle(fontSize: 20.0), // Adjust font size as needed
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
