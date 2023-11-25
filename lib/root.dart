import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/feildInfo.dart';
import 'profile.dart';
import 'profileInfo.dart';
import 'NavBar.dart';

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
        'https://business-card-backend-2.vercel.app/cards/cards/jack@gmail.com'));

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
          // Your content here
          // Example content that can go behind the positioned button
          Container(
            color: Colors.white, // Replace with your content
          ),
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
        ],
      ),
      drawer: NavBar(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (_currentPage > 0)
            FloatingActionButton(
              onPressed: () {
                _pageController.previousPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: Icon(Icons.arrow_back),
            ),
          SizedBox(width: 10),
          if (_currentPage < profiles.length - 1)
            FloatingActionButton(
              onPressed: () {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: Icon(Icons.arrow_forward),
            ),
        ],
      ),
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
