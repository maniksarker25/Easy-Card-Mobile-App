import 'package:flutter/material.dart';

class FieldInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          MobileRow(Icons.phone, '+88017478154', '8801', 'work'),
          // WebsiteRow(Icons.web_rounded, 'website'),
          // SizedBox(height: 10), // Adjust the height as needed
          // Add more widgets to the column if necessary
          // Text('Additional Content', style: TextStyle(fontSize: 18)),
          // Add more widgets as needed
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
                style: TextStyle(fontSize: 20), textAlign: TextAlign.left)
          ],
        )
      ],
    );
  }
}
//   Widget MobileRow(IconData iconData, String text, String ext, String label) {
//     return Row(
//       children: [
//         Icon(iconData, size: 30, color: Color.fromARGB(134, 204, 22, 22)),
//         SizedBox(width: 20),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Text(text, style: TextStyle(fontSize: 20)),
//                 Padding(
//                   padding: EdgeInsets.only(left: 20),
//                   child: Text(ext, style: TextStyle(fontSize: 20)),
//                 ),
//               ],
//             ),
//             Text(label,
//                 style: TextStyle(fontSize: 20), textAlign: TextAlign.left)
//           ],
//         )
//       ],
//     );
//   }
// }
