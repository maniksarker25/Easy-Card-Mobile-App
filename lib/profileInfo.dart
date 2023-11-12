import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50.0),
            height: 80.0,
            width: double.infinity,
            child: Image.asset(
              '../asset/logo_01.png', // Replace with your image URL or use AssetImage for local assets
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
                    "Dr. Spyridon Georgios",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold, // Make the text bold
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 0.0),
                  child: Text(
                    "Poulis Suffix (Sotos)",
                    style:
                        TextStyle(fontSize: 25.0), // Adjust font size as needed
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    "CEO",
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
