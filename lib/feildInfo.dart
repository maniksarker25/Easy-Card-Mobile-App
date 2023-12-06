// import 'package:flutter/material.dart';

// class FieldInfo extends StatelessWidget {
//   final Map<String, dynamic> profile;

//   const FieldInfo({Key? key, required this.profile}) : super(key: key);

//   // Function to map field types to corresponding icons
//   IconData getIconForFieldType(String type) {
//     switch (type) {
//       case 'Phone':
//         return Icons.phone;
//       case 'Website':
//         return Icons.web;
//       case 'Email':
//         return Icons.email;
//       case 'Address':
//         return Icons.location_on;
//       case "Link":
//         return Icons.link;
//       case "Whatsapp":
//         return Icons.whatshot_outlined;
//       case "Viber":
//         return Icons.call;
//       default:
//         return Icons.error; // Default icon for unknown types
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<Map<String, dynamic>> fields =
//         List<Map<String, dynamic>>.from(profile['fields']);

//     print(fields);

//     return Container(
//       padding: EdgeInsets.all(10.0),
//       margin: EdgeInsets.all(10.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: fields.map((field) {
//           String type = field['type'];
//           String value = '';
//           String subValue = "";
//           String socialValue = "";

//           // Determine the value based on the type
//           if (type == 'Phone') {
//             value = field['number'];
//           } else if (type == 'Website') {
//             value = field['label'];
//           } else if (type == 'Email') {
//             value = field['url'];
//             subValue = field['label'];
//           } else if (type == 'Address') {
//             value = field['address'];
//           } else if (type == 'Link') {
//             value = field['displayUrl'];
//             subValue = field["label"];
//           } else if (type == 'WhatsApp') {
//             value = field['number'];
//             subValue = field["label"];
//           } else if (type == 'Viber') {
//             value = field['number'];
//             subValue = field["label"];
//           } else if (type == 'Skype') {
//             value = field['number'];
//             subValue = field["label"];
//           } else if (type == 'Snapchat') {
//             value = field['number'];
//             subValue = field["label"];
//           } else if (type == 'Signal') {
//             value = field['number'];
//             subValue = field["label"];
//           } else if (type == 'Telegram') {
//             value = field['number'];
//             subValue = field["label"];
//           } else if (type == 'Discord') {
//             value = field['number'];
//             subValue = field["label"];
//           } else if (type == 'Slack') {
//             value = field['number'];
//             subValue = field["label"];
//           } else if (type == 'Facebook') {
//             socialValue = field['url'];
//           } else if (type == 'Instagram') {
//             socialValue = field['url'];
//           }

//           IconData iconData = getIconForFieldType(type);

//           return Container(
//               margin: EdgeInsets.only(top: 15), // Margin top of 5px
//               child: Row(
//                 children: [
//                   Icon(
//                     iconData,
//                     size: 30,
//                     color: Color(0xFF0084FF),
//                   ), // Display the icon
//                   SizedBox(width: 10), // Add space between icon and text
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Visibility(
//                           visible: value
//                               .isNotEmpty, // Show only if subValue is not empty
//                           child: Text(
//                             '$value',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w300,
//                             ),
//                           ),
//                         ),
//                         Visibility(
//                           visible: subValue
//                               .isNotEmpty, // Show only if subValue is not empty
//                           child: Text(
//                             '$subValue',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w300,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ));
//         }).toList(),
//       ),
//     );
//   }
// }

// newly try this thing ------------

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FieldInfo extends StatelessWidget {
  final Map<String, dynamic> profile;

  // Receive the data as a parameter in the constructor
  const FieldInfo({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> fields =
        List<Map<String, dynamic>>.from(profile['fields']);
    print(fields);

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
              WebsiteRow(Icons.web_rounded, field['label'])
            else if (field['type'] == 'Email')
              TwoDataRow(Icons.email, field['url'], field["label"])
            else if (field['type'] == 'Address')
              TwoDataRow(
                  FontAwesomeIcons.mapMarker, field['address'], field["label"])
            else if (field['type'] == 'Link')
              TwoDataRow(Icons.link, field['url'], field["label"])
            else if (field['type'] == 'Whatsapp')
              TwoDataRow(
                  FontAwesomeIcons.whatsapp, field['number'], field["label"])
            else if (field['type'] == 'Viber')
              TwoDataRow(
                  FontAwesomeIcons.viber, field['number'], field["label"])
            else if (field['type'] == 'Skype')
              TwoDataRow(
                  FontAwesomeIcons.snapchat, field['number'], field["label"])
            else if (field['type'] == 'Snapchat')
              TwoDataRow(
                  FontAwesomeIcons.snapchat, field['number'], field["label"])
            else if (field['type'] == 'Signal')
              TwoDataRow(
                  FontAwesomeIcons.signal, field['number'], field["label"])
            else if (field['type'] == 'Telegram')
              TwoDataRow(
                  FontAwesomeIcons.telegram, field['number'], field["label"])
            else if (field['type'] == 'Discord')
              TwoDataRow(
                  FontAwesomeIcons.discord, field['number'], field["label"])
            else if (field['type'] == 'Slack')
              TwoDataRow(
                  FontAwesomeIcons.slack, field['number'], field["label"])
            else if (field['type'] == 'Facebook')
              SocialMediaRow([
                if (field['type'] == 'Facebook') FontAwesomeIcons.facebook,
              ])
            else if (field['type'] == 'Instagram')
              SocialMediaRow([
                if (field['type'] == 'Instagram') FontAwesomeIcons.instagram,
              ])
            else if (field['type'] == 'Twitter')
              SocialMediaRow([
                if (field['type'] == 'Twitter') FontAwesomeIcons.twitter,
              ])
            else if (field['type'] == 'LinkedIn')
              SocialMediaRow([
                if (field['type'] == 'LinkedIn') FontAwesomeIcons.linkedin,
              ])
            else if (field['type'] == 'Pinterest')
              SocialMediaRow([
                if (field['type'] == 'Pinterest') FontAwesomeIcons.pinterest,
              ])
            else if (field['type'] == 'Tiktok')
              SocialMediaRow([
                if (field['type'] == 'Tiktok') FontAwesomeIcons.tiktok,
              ])
            else if (field['type'] == 'Image')
              ImageRow(field['image']),
          // Add more widgets to the column if necessary
        ],
      ),
    );
  }

  Widget MobileRow(IconData iconData, String text, String ext, String label) {
    return Row(
      children: [
        Icon(iconData, size: 35, color: Color(0xFF0084FF)),
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

  Widget WebsiteRow(IconData iconData, String text) {
    return Row(
      children: [
        Icon(iconData, size: 35, color: Color(0xFF0084FF)),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(text, style: TextStyle(fontSize: 22)),
        ),
      ],
    );
  }

  Widget TwoDataRow(IconData iconData, String text, String subText) {
    return Container(
      margin: EdgeInsets.only(top: 10), // Add margin top and bottom
      child: Row(
        children: [
          Icon(iconData, size: 35, color: Color(0xFF0084FF)),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text, style: TextStyle(fontSize: 22)),
                SizedBox(height: 5), // Adding some space between texts
                Text(
                  subText,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget SocialMediaRow(List<IconData> iconDataList) {
    return Row(
      children: iconDataList.map((iconData) {
        print(iconData);
        return Padding(
          padding: EdgeInsets.only(
              right: 20, top: 8), // Adjust the right padding as needed
          child: Icon(iconData, size: 40, color: Color(0xFF0084FF)),
        );
      }).toList(),
    );
  }
}

// Updated ImageRow widget function
Widget ImageRow(String imageUrl) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 4, vertical: 20),
    width: double.infinity, // Full width
    height: 200, // Fixed height of 200 pixels
    child: ClipRRect(
      // borderRadius: BorderRadius.circular(8.0), // Optional: Add border radius
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover, // Adjust the image fit as needed
      ),
    ),
  );
}

//---------------------

