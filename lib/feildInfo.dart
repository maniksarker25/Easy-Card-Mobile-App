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
    // print(fields);

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
            else if (field['type'] == 'Header')
              HeaderRow(field['title'])
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
              ImageRow(field['image'])
            else if (field['type'] == 'Galary')
              GalleryRow(field['image']),
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
        // print(iconData);
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
Widget GalleryRow(dynamic imageUrls) {
  List<String> imageUrlList = List<String>.from(imageUrls ?? []);
  // print(imageUrlList);
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 1,
          ),
          itemCount: imageUrls.length,
          itemBuilder: (context, index) {
            return ImageRow(imageUrls[index]);
          },
        ),
      ],
    ),
  );
}

// component for header ---------
Widget HeaderRow(String title) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8), // Adding left padding
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ],
    ),
  );
}
