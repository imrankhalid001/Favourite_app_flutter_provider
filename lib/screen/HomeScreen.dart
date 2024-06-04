import 'package:fav_app_with_provider_flutter/screen/value_notifier_listener.dart';
import 'package:flutter/material.dart';

import 'dark_theme.dart';
import 'favourite/favourite_screen.dart';
import 'login.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FavouriteScreen()),
                );
              },
              child: Text('Favourite Screen'),
            ),

            SizedBox(
              height: 20,
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DarkThemeScreen()),
                );
              },
              child: Text('Change Theme'),
            ),

            SizedBox(
              height: 20,
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotifierListenerScreen()),
                );
              },
              child: Text('Password Screen'),
            ),

            SizedBox(
              height: 20,
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text('Login Screen'),
            ),

            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

