// MyComponent.dart
import 'package:flutter/material.dart';
import 'profile.dart';
import 'profileInfo.dart';

class MyComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Ensure this property is set
      children: [
        ProfileComponent(),
        ProfileInfo(),
      ],
    );
  }
}
