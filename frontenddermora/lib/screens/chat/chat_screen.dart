// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:frontenddermora/util/styles.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/body.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: buildNavigationBar(),
    );
  }

  AppBar buildAppBar() {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      elevation: 0,
      centerTitle: true,
      title: Padding(
        padding: EdgeInsets.only(top: screenWidth * 0.1),
        child: Text(
          "Chat Room",
          style: GoogleFonts.roboto(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
        )
      ],
    );
  }

  BottomNavigationBar buildNavigationBar() {
    return BottomNavigationBar(
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
    );
  }
}
