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
          title: const Text('Profile'),
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
        const SizedBox(height: 20.0),
        const CircleAvatar(
          radius: 50.0,
          backgroundImage: AssetImage('assets/profile_pic.jpg'), // Replace with your profile picture asset
        ),
        const SizedBox(height: 10.0),
        const Center(
          child: Text(
            'Vaibhav Ganesh Deshpande', // Replace with your username
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        Center(
          child: TextButton(
            onPressed: () {
              // Add functionality to edit profile
            },
            child: const Text('Edit'),
          ),
        ),
        const SizedBox(height: 40.0),
        ListTile(
          leading: const Icon(Icons.account_circle),
          title: const Text('Account'),
          onTap: () {
            // Add functionality to navigate to account screen
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () {
            // Add functionality to navigate to settings screen
          },
        ),
        ListTile(
          leading: const Icon(Icons.file_download),
          title: const Text('Export Data'),
          onTap: () {
            // Add functionality to export data
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
          onTap: () {
            // Add functionality to logout
          },
        ),
      ],
    );
  }
}
