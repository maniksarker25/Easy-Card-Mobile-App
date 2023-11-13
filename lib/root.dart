// MyComponent.dart
import 'package:flutter/material.dart';
import 'package:my_app/feildInfo.dart';
import 'profile.dart';
import 'profileInfo.dart';

class MyComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileComponent(),
          ProfileInfo(),
          FieldInfo(),
        ],
      ),
    );
  }
}
