import 'package:flutter/material.dart';
import 'package:frontenddermora/screens/auth/login.dart';
import 'package:frontenddermora/screens/chat/chat_screen.dart';
import 'package:frontenddermora/screens/entry.dart';
import 'package:frontenddermora/screens/home/homepage_screen.dart';
import 'package:frontenddermora/screens/profile/profile_screen.dart';
import 'package:frontenddermora/screens/routine/components/edit_routine.dart';
import 'package:frontenddermora/screens/welcome/welcome_screen.dart';
import 'package:frontenddermora/services/api_service.dart';
import 'package:frontenddermora/services/shared_service.dart';
import 'package:frontenddermora/util/styles.dart';

import 'doctor_screens/doctorEntery.dart';
import 'screens/auth/register.dart';

Widget _defaultHome = const LoginScreen();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool _result = await SharedService.isLoggedIn();
  if (_result) {
    var loginDetails = await SharedService.loginDetails();
    if (loginDetails!.data.user.kind != "doctor") {
      _defaultHome = EntryWidget(selectedIndex: 0);
    } else {
      _defaultHome = DoctorEntryWidget(selectedIndex: 0);
    }
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      routes: {
        '/': (context) => _defaultHome,
        '/register': (context) => const RegisterScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomePageScreen(),
        '/chat': (context) => const ChatScreen(),
      },
    );
  }
}
