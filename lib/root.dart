// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:my_app/feildInfo.dart';
// import 'profile.dart';
// import 'profileInfo.dart';
// import 'NavBar.dart';
// import 'anotherPage.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class MyComponent extends StatefulWidget {
//   @override
//   _MyComponentState createState() => _MyComponentState();
// }

// class _MyComponentState extends State<MyComponent> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   List<Map<String, dynamic>> profiles = [];
//   PageController _pageController = PageController(initialPage: 0);
//   int _currentPage = 0;

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     final response = await http.get(Uri.parse(
//         'https://business-card-backend-2.vercel.app/cards/cards/tom@gmail.com'));

//     if (response.statusCode == 200) {
//       setState(() {
//         profiles = List<Map<String, dynamic>>.from(json.decode(response.body));
//       });
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(0), // Hide original AppBar
//         child: Container(), // Empty container or null
//       ),
//       body: Stack(
//         children: [
//           // Your content here
//           // Example content that can go behind the positioned button
//           Container(
//             color: Colors.white, // Replace with your content
//           ),
//           profiles.isEmpty
//               ? Center(
//                   child: CircularProgressIndicator(),
//                 )
//               : PageView.builder(
//                   itemCount: profiles.length,
//                   controller: _pageController,
//                   onPageChanged: (int index) {
//                     setState(() {
//                       _currentPage = index;
//                     });
//                   },
//                   itemBuilder: (BuildContext context, int index) {
//                     return ProfilePage(profile: profiles[index]);
//                   },
//                 ),
//           Positioned(
//             top: 10,
//             left: 10,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 shape: BoxShape.circle,
//               ),
//               child: IconButton(
//                 icon: Icon(Icons.menu),
//                 color: Colors.black, // Icon color
//                 onPressed: () {
//                   _scaffoldKey.currentState?.openDrawer();
//                 },
//               ),
//             ),
//           ),

//           // Positioned button at bottom right
//           Positioned(
//             bottom: 5,
//             right: 5,
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius:
//                     BorderRadius.circular(12), // Adjust the radius as needed
//                 color: Colors.black,
//               ),
//               padding: EdgeInsets.symmetric(
//                   horizontal: 10, vertical: 5), // Adjust padding as needed
//               child: InkWell(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => AnotherPage()),
//                   );
//                 },
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     FaIcon(
//                       FontAwesomeIcons
//                           .paperPlane, // Replace with the Font Awesome icon you want
//                       color: Colors.white,
//                       size: 20, // Adjust the size as needed
//                     ), // Replace with your icon
//                     SizedBox(
//                       width: 30,
//                       height: 20,
//                     ), // Adjust the gap as needed
//                     Text(
//                       "Send",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       drawer: NavBar(),
//       // Removed previous floatingActionButton here
//     );
//   }
// }

// class ProfilePage extends StatelessWidget {
//   final Map<String, dynamic> profile;

//   ProfilePage({required this.profile});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ProfileComponent(profile: profile),
//           ProfileInfo(profile: profile),
//           FieldInfo(profile: profile),
//           // Other components/widgets using profile data
//         ],
//       ),
//     );
//   }
// }

// try another way

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/feildInfo.dart';
import 'profile.dart';
import 'profileInfo.dart';
import 'NavBar.dart';
import 'anotherPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyComponent(),
    );
  }
}

class MyComponent extends StatefulWidget {
  @override
  _MyComponentState createState() => _MyComponentState();
}

class _MyComponentState extends State<MyComponent> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Map<String, dynamic>> profiles = [];
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://business-card-backend-2.vercel.app/cards/cards/tom@gmail.com'));

    if (response.statusCode == 200) {
      setState(() {
        profiles = List<Map<String, dynamic>>.from(json.decode(response.body));
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0), // Hide original AppBar
        child: Container(), // Empty container or null
      ),
      body: Stack(
        children: [
          profiles.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : PageView.builder(
                  itemCount: profiles.length,
                  controller: _pageController,
                  onPageChanged: (int index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return ProfilePage(profile: profiles[index]);
                  },
                ),
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.menu),
                color: Colors.black, // Icon color
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ),
            ),
          ),

          // Positioned button at bottom right
          Positioned(
            bottom: 5,
            right: 5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(12), // Adjust the radius as needed
                color: Colors.black,
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: 10, vertical: 5), // Adjust padding as needed
              child: InkWell(
                onTap: () {
                  if (profiles.isNotEmpty && _currentPage < profiles.length) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AnotherPage(profile: profiles[_currentPage]),
                      ),
                      // MaterialPageRoute(builder: (context) => AnotherPage()),
                    );
                  }
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Send",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: NavBar(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final Map<String, dynamic> profile;

  ProfilePage({required this.profile});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileComponent(profile: profile),
          ProfileInfo(profile: profile),
          FieldInfo(profile: profile),
          // Other components/widgets using profile data
        ],
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        // Drawer content
        );
  }
}
// kdjfkdjfkdjfkj

