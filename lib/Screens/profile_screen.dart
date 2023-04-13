import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapp/Screens/home_screen.dart';
import 'package:flutterapp/Screens/login_screen.dart';
import 'package:flutterapp/Screens/download_data.dart';
import 'package:flutterapp/Screens/setup_screen.dart';
import 'package:flutterapp/Screens/settings_screen.dart';
import 'package:flutterapp/Screens/profile_screen.dart';
import 'package:flutterapp/Screens/upload_data.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _name = '';
  String _email = '';

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final response = await http.get(Uri.parse('http://your-api-endpoint-here.com'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _name = data['name'];
        _email = data['email'];
      });
    } else {
      throw Exception('Failed to fetch data from server');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 40, /// set the color of the AppBar buttons
        ),
        title: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 50, 0),
            child: Center(
              child: Image.asset(
                'assets/images/logo.png', // replace this with the path to your image
                height: 60, // set the height of the image
              ),
            ),
          ),
        ),
        elevation: 0,
        toolbarHeight: 80,
      ),
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/marketbanner.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 15),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('AMBULANT COLLECTION ',
                    style: TextStyle(color: Colors.black)),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => HomeScreen()),
                  );
                },
              ),

              ListTile(
                leading: Icon(Icons.cloud_download),
                title: Text('DOWNLOAD DATA',
                    style: TextStyle(color: Colors.black)),
                onTap: () {
                  // TODO: navigate to Download Data Screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => DownloadData()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.cloud_upload),
                title:
                Text('UPLOAD DATA', style: TextStyle(color: Colors.black)),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => UploadData()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.build),
                title: Text('SET UP', style: TextStyle(color: Colors.black)),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => SetUp()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('SETTINGS', style: TextStyle(color: Colors.black)),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => SettingsScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('PROFILE', style: TextStyle(color: Colors.black)),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => ProfileScreen()),
                  );
                },
              ),
              Divider(), // Add a divider before the Logout button
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('LOGOUT', style: TextStyle(color: Colors.black)),
                onTap: () {
                  // TODO: log out user and navigate to Login Screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => LoginScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/profile_picture.jpg'),
            ),
            SizedBox(height: 20),
            Text(
              _name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Software Engineer',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'john.doe@example.com',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),


    );
  }
}

