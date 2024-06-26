import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/theme_changer_provider.dart';


class DarkThemeScreen extends StatefulWidget {
  const DarkThemeScreen({super.key});

  @override
  State<DarkThemeScreen> createState() => _DarkThemeScreenState();
}

class _DarkThemeScreenState extends State<DarkThemeScreen> {
  @override
  Widget build(BuildContext context) {

    final themeChanger  = Provider.of<ThemeChanger>(context);


    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Screen'),
      ),
      body:Column(
        children: [

          // light theme
          RadioListTile<ThemeMode>(
            title: Text('Light mode'),
              value: ThemeMode.light,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme
          ),

          // Dark theme

          RadioListTile<ThemeMode>(
              title: Text('Dark mode'),
              value: ThemeMode.dark,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme
          ),


          // System theme

          RadioListTile<ThemeMode>(
              title: Text('System mode'),
              value: ThemeMode.system,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme
          ),

          Icon(Icons.favorite)


        ],
      ),
    );
  }
}
