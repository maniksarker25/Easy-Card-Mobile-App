// MyComponent.dart

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/feildInfo.dart';
import 'profile.dart';
import 'profileInfo.dart';

class MyComponent extends StatefulWidget {
  @override
  _MyComponentState createState() => _MyComponentState();
}

class _MyComponentState extends State<MyComponent> {
  Map<String, dynamic> profile = {};

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://business-card-backend-2.vercel.app/cards/visit/c78cdk0'));

    if (response.statusCode == 200) {
      setState(() {
        profile = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileComponent(profile: profile),
          ProfileInfo(profile: profile),
          FieldInfo(profile: profile),
          // Display the fetched profiles
          // Text(profile['email'] ?? 'No email available'),
        ],
      ),
    );
  }
}
