import 'package:fav_app_with_provider_flutter/provider/favourite_provider.dart';
import 'package:fav_app_with_provider_flutter/screen/favourite/favourite_screen.dart';
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
      ChangeNotifierProvider(create: (_) => FavouriteItemProvider())

    ],


      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      primarySwatch: Colors.blue,
      ),
      home: const FavouriteScreen(),
      ),
    );





  }
}
