// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_escapes

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontenddermora/services/api_service.dart';
import 'package:frontenddermora/util/styles.dart';
import 'package:google_fonts/google_fonts.dart';

import './components/DoctorsDetails.dart';
import './components/cardDetails.dart';
import 'components/body.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreen();
}

class _HomePageScreen extends State<HomePageScreen> {
  int _selectedIndex = 1;

  List<Map> list2 = [
    {
      "image": "assets/images/doctor_1.png",
      "label": "Dr. Mohamed Ahmed ",
      "Key": "Dermatologist   4 Years Experience"
    },
    {
      "image": "assets/images/doctor_2.png",
      "label": "Dr. Amirah Egeh ",
      "Key": "Dermatologist   6 Years Experience"
    },
    {
      "image": "assets/images/doctor_3.png",
      "label": "Dr. Ali Dale Morse",
      "Key": "Dermatologist   9 Years Experience",
    },
  ];
  get screenWidth => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          buildAppBar(),
        ],
        body: Body(),
      ),
    );
  }

  SliverAppBar buildAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.white,
      // Color(0xFFCCD9FD),
      toolbarHeight: 90,
      forceElevated: true,
      elevation: 4,
      shadowColor: kSecBlue,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(70),
        bottomLeft: Radius.circular(70),
      )),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(children: [
              Text(
                'Hello, Furqan',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Welcome!",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 12.0,
                ),
              ),
            ]),
          ),
        ],
      ),
      actions: [
        Row(
          children: [
            Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(blurRadius: 7, spreadRadius: 3, color: kSecBlue)
              ], shape: BoxShape.circle, color: kSecBlue.withOpacity(0.1)),
              child: Image.asset(
                "assets/images/avatar.png",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              width: 40,
            )
          ],
        )
      ],
    );
  }
}
