import 'package:flutter/material.dart';

class AnotherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Send Your Card"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Add a SizedBox to create some space between app bar and text
          SizedBox(height: 16),
          // Add an Image widget below the text
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Image.network(
              'https://static.beaconstac.com/assets/img/static-vs-dynamic-qr-code-images/new-qr-reload.png',
              width: double.infinity,
              height: 250.0,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          // Add the additional text centered horizontally
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "Point your camera at the QR code to receive the card",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


