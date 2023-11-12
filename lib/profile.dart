import 'package:flutter/material.dart';

class ProfileComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  topLeft: Radius.circular(8.0), // Adjust border radius as needed
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
                  child: Image.asset(
                    '../asset/360_F_532490606_lWUgTqWQ1z4BoBenNaWVympo1OiKWGI9-removebg-preview.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 6,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Set background color to white
                  borderRadius: BorderRadius.circular(20), // Adjust border radius as needed
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.menu, color: Colors.black), // Set icon color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
