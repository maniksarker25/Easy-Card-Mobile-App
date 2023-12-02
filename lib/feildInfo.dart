// import 'package:flutter/material.dart';

// class FieldInfo extends StatelessWidget {
//   final Map<String, dynamic> profile;

//   // Receive the data as a parameter in the constructor
//   const FieldInfo({Key? key, required this.profile}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     List<Map<String, dynamic>> fields =
//         List<Map<String, dynamic>>.from(profile['fields']);
//     print(fields);

//     return Container(
//       padding: EdgeInsets.all(10.0),
//       margin: EdgeInsets.all(10.0),
//       child: Column(
//         children: [
//           for (Map<String, dynamic> field in fields)
//             if (field['type'] == 'Phone')
//               MobileRow(
//                 Icons.phone,
//                 field['number'],
//                 field['ext'],
//                 field['chooseLabel'],
//               )
//             else if (field['type'] == 'Website')
//               WebsiteRow(Icons.web_rounded, field['type']),
//           // Add more widgets to the column if necessary
//         ],
//       ),
//     );
//   }

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
//                 style: TextStyle(fontSize: 20), textAlign: TextAlign.left),
//           ],
//         ),
//       ],
//     );
//   }
// }

// Widget WebsiteRow(IconData iconData, String text) {
//   return Row(
//     children: [
//       Icon(iconData, size: 30, color: Color.fromARGB(134, 204, 22, 22)),
//       Padding(
//         padding: EdgeInsets.only(left: 20),
//         child: Text(text, style: TextStyle(fontSize: 20)),
//       ),
//     ],
//   );
// }

// new component testing ------

// import 'package:flutter/material.dart';

// class FieldInfo extends StatelessWidget {
//   final Map<String, dynamic> profile;

//   // Receive the data as a parameter in the constructor
//   const FieldInfo({Key? key, required this.profile}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     List<Map<String, dynamic>> fields =
//         List<Map<String, dynamic>>.from(profile['fields']);
//     print(fields);

//     return Container(
//       padding: EdgeInsets.all(10.0),
//       margin: EdgeInsets.all(10.0),
//       child: Column(
//         children: [
//           Text("What is this")
//           // Add more widgets to the column if necessary
//         ],
//       ),
//     );
//   }
// }

// just test with chat gpt ------------
// import 'package:flutter/material.dart';

// class FieldInfo extends StatelessWidget {
//   final Map<String, dynamic> profile;

//   const FieldInfo({Key? key, required this.profile}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     List<Map<String, dynamic>> fields =
//         List<Map<String, dynamic>>.from(profile['fields']);

//     return Container(
//       padding: EdgeInsets.all(10.0),
//       margin: EdgeInsets.all(10.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: fields.map((field) {
//           String type = field['type'];
//           String value = '';

//           // Determine the value based on the type
//           if (type == 'Phone') {
//             value = field['number'];
//           } else if (type == 'Website') {
//             value = field['url'];
//           } else if (type == 'Email') {
//             value = field['url'];
//           } else if (type == "Address") {
//             value = field["address"];
//           }

//           return Text('$type: $value');
//         }).toList(),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class FieldInfo extends StatelessWidget {
  final Map<String, dynamic> profile;

  const FieldInfo({Key? key, required this.profile}) : super(key: key);

  // Function to map field types to corresponding icons
  IconData getIconForFieldType(String type) {
    switch (type) {
      case 'Phone':
        return Icons.phone;
      case 'Website':
        return Icons.web;
      case 'Email':
        return Icons.email;
      case 'Address':
        return Icons.location_on;
      // Add more cases for other types if needed
      default:
        return Icons.error; // Default icon for unknown types
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> fields =
        List<Map<String, dynamic>>.from(profile['fields']);

    print(fields);

    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: fields.map((field) {
          String type = field['type'];
          String value = '';
          String subValue = "";

          // Determine the value based on the type
          if (type == 'Phone') {
            value = field['number'];
          } else if (type == 'Website') {
            value = field['label'];
          } else if (type == 'Email') {
            value = field['url'];
            subValue = field['label'];
          } else if (type == 'Address') {
            value = field['address'];
          }

          IconData iconData = getIconForFieldType(type);

          return Container(
              margin: EdgeInsets.only(top: 15), // Margin top of 5px
              child: Row(
                children: [
                  Icon(
                    iconData,
                    size: 30,
                    color: Color.fromARGB(85, 22, 34, 204),
                  ), // Display the icon
                  SizedBox(width: 10), // Add space between icon and text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          // '$type: $value',
                          '$value',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight:
                                FontWeight.w300, // Font size of the text
                          ),
                        ),
                        Visibility(
                          visible: subValue
                              .isNotEmpty, // Show only if subValue is not empty
                          child: Text(
                            '$subValue',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ));
        }).toList(),
      ),
    );
  }
}
