// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:frontenddermora/util/styles.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreen();
}

class _HomePageScreen extends State<HomePageScreen> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (value) => {
          setState(() {
            _selectedIndex = value;
          })
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: kSecBlue,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: kSecBlue,
            ),
            activeIcon: Icon(
              Icons.home,
              color: kSecBlue,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_alt_outlined,
              color: kSecBlue,
            ),
            activeIcon: Icon(
              Icons.camera_alt,
              color: kSecBlue,
            ),
            label: "Camera",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.messenger_outline_rounded,
              color: kSecBlue,
            ),
            activeIcon: Icon(
              Icons.messenger,
              color: kSecBlue,
            ),
            label: "Chats",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              color: kSecBlue,
            ),
            activeIcon: Icon(
              Icons.person,
              color: kSecBlue,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      elevation: 0.0,
      title: Text("Chats"),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
        )
      ],
    );
  }
}
