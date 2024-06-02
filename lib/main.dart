import 'package:fav_app_with_provider_flutter/provider/favourite_provider.dart';
import 'package:fav_app_with_provider_flutter/provider/theme_changer_provider.dart';
import 'package:fav_app_with_provider_flutter/screen/HomeScreen.dart';
import 'package:fav_app_with_provider_flutter/screen/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavouriteItemProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChanger())
      ],
      child: Builder(builder: (BuildContext context){

        final themeChanger  = Provider.of<ThemeChanger>(context);

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          themeMode: themeChanger.themeMode,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.blue,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.purple,
            primaryColor: Colors.purple,
              // to change background color of app bar
             appBarTheme: AppBarTheme(
               backgroundColor: Colors.teal
             ),

              // to change icons in dark mode
            iconTheme: IconThemeData(
              color: Colors.pink
          )
          ),
          home: HomeScreen(),
        );
      }),
    );
  }
}
