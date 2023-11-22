import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  final VoidCallback onClose;

  const Sidebar({Key? key, required this.onClose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Sidebar Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Option 1'),
            onTap: () {
              // Handle option 1
              onClose(); // Close the sidebar
            },
          ),
          ListTile(
            title: Text('Option 2'),
            onTap: () {
              // Handle option 2
              onClose(); // Close the sidebar
            },
          ),
          // Add more ListTile widgets for additional options
        ],
      ),
    );
  }
}
