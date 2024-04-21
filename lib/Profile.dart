import 'package:flutter/material.dart';

void main() {
  runApp(ProfileScreen());
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          centerTitle: true,
        ),
        body: ProfileBody(),
      ),
    );
  }
}

class ProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(height: 20.0),
        CircleAvatar(
          radius: 50.0,
          backgroundImage: AssetImage('assets/profile_pic.jpg'), // Replace with your profile picture asset
        ),
        SizedBox(height: 10.0),
        Center(
          child: Text(
            'John Doe', // Replace with your username
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 10.0),
        Center(
          child: TextButton(
            onPressed: () {
              // Add functionality to edit profile
            },
            child: Text('Edit'),
          ),
        ),
        SizedBox(height: 40.0),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('Account'),
          onTap: () {
            // Add functionality to navigate to account screen
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          onTap: () {
            // Add functionality to navigate to settings screen
          },
        ),
        ListTile(
          leading: Icon(Icons.file_download),
          title: Text('Export Data'),
          onTap: () {
            // Add functionality to export data
          },
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('Logout'),
          onTap: () {
            // Add functionality to logout
          },
        ),
      ],
    );
  }
}
