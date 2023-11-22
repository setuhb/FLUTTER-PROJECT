import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/profile_image.jpg'),
                ),
                SizedBox(height: 10),
                Text(
                  'Manna',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              // Handle drawer item tap for Home
              Navigator.pop(context);
              // Add your navigation logic here
            },
          ),
          ListTile(
            leading: Icon(Icons.sunny),
            title: Text('Weather'),
            onTap: () {
              // Handle drawer item tap for Home
              Navigator.pop(context);
              // Add your navigation logic here
            },
          ),
        ],
      ),
    );
  }
}
