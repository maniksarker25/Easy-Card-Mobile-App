import 'package:flutter/material.dart';

class FieldInfo extends StatelessWidget {
  final Map<String, dynamic> profile;

  // Receive the data as a parameter in the constructor
  const FieldInfo({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> fields =
        List<Map<String, dynamic>>.from(profile['fields']);

    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          for (Map<String, dynamic> field in fields)
            if (field['type'] == 'Phone')
              MobileRow(
                Icons.phone,
                field['number'],
                field['ext'],
                field['chooseLabel'],
              )
            else if (field['type'] == 'Website')
              WebsiteRow(Icons.web_rounded, field['type']),
          // Add more widgets to the column if necessary
        ],
      ),
    );
  }

  Widget MobileRow(IconData iconData, String text, String ext, String label) {
    return Row(
      children: [
        Icon(iconData, size: 30, color: Color.fromARGB(134, 204, 22, 22)),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(text, style: TextStyle(fontSize: 20)),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(ext, style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
            Text(label,
                style: TextStyle(fontSize: 20), textAlign: TextAlign.left),
          ],
        ),
      ],
    );
  }
}

Widget WebsiteRow(IconData iconData, String text) {
  return Row(
    children: [
      Icon(iconData, size: 30, color: Color.fromARGB(134, 204, 22, 22)),
      Padding(
        padding: EdgeInsets.only(left: 20),
        child: Text(text, style: TextStyle(fontSize: 20)),
      ),
    ],
  );
}
