import 'package:flutter/material.dart';
import 'package:frontenddermora/screens/chat/chat_screen.dart';
import 'package:frontenddermora/screens/profile/profile_screen.dart';
import 'package:frontenddermora/screens/welcome/welcome_screen.dart';
import 'package:frontenddermora/util/styles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: primary,
        // ignore: deprecated_member_use
        accentColor: salmon,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: ProfileScreen(),
    );
  }
}
