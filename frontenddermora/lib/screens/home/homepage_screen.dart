// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_escapes

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontenddermora/util/styles.dart';
import 'package:google_fonts/google_fonts.dart';

import './components/DoctorsDetails.dart';
import './components/cardDetails.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreen();
}

class _HomePageScreen extends State<HomePageScreen> {
  int _selectedIndex = 0;

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
      appBar: buildAppBar(),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 15.0,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(children: [
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
                          Icon(
                            Icons.notifications_none,
                            size: 30,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      SizedBox(height: 40.0),
                      _buildTextBeforeBanner(),
                      SizedBox(height: 20.0),
                      BannerCard(),
                      SizedBox(height: 20.0),
                      _buildTextTodaysPlan(),
                      SizedBox(height: 20.0),
                      _buildMorningRoutine(),
                      SizedBox(height: 20.0),
                      _buildNightRoutine(),
                      SizedBox(height: 30.0),
                      _buildTextDoctors(),
                      SizedBox(height: 10.0),
                      DoctorsDetails(list: list2),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildNavigationBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      elevation: 0,
      /*actions: <Widget>[
        Icon(
          Icons.notifications_none,
          size: 30,
          color: Colors.black,
        ),
      ],*/
    );
  }

  Widget _buildTextBeforeBanner() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        "Tips for a better Skin",
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }

  Widget _buildTextTodaysPlan() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        "Today’s plan",
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }

  Widget _buildMorningRoutine() {
    return Container(
      padding: const EdgeInsets.all(0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: kSecBlue),
        borderRadius: BorderRadius.circular(10.25),
        boxShadow: [
          BoxShadow(
            color: klightGrey.withOpacity(.8),
            offset: Offset(2, 4),
            blurRadius: 1,
            spreadRadius: 0,
          )
        ],
      ),
      child: ListTile(
        leading: Image.asset('assets/images/sun.png'),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Morning Routine ",
                style: const TextStyle(
                  fontSize: 14,
                  color: kSecBlue,
                ),
                softWrap: true,
                maxLines: 3,
                textAlign: TextAlign.center),
            SizedBox(height: 5.0),
            Text(
              "9:00 AM ",
              style: const TextStyle(
                fontSize: 14,
                color: kSecBlue,
              ),
              softWrap: true,
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5.0),
            Text(
              "Everyday ",
              style: const TextStyle(
                fontSize: 14,
                color: kSecBlue,
              ),
              softWrap: true,
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          size: 30,
          color: kSecBlue,
        ),
      ),
    );
  }

  Widget _buildNightRoutine() {
    return Container(
      padding: const EdgeInsets.all(0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: kSecBlue),
        borderRadius: BorderRadius.circular(10.25),
        boxShadow: [
          BoxShadow(
            color: klightGrey.withOpacity(.8),
            offset: Offset(2, 4),
            blurRadius: 1,
            spreadRadius: 0,
          )
        ],
      ),
      child: ListTile(
        leading: Image.asset('assets/images/moon.png'),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Night Routine ",
              style: const TextStyle(
                fontSize: 14,
                color: kSecBlue,
              ),
              softWrap: true,
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5.0),
            Text(
              "10:00 PM ",
              style: const TextStyle(
                fontSize: 14,
                color: kSecBlue,
              ),
              softWrap: true,
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5.0),
            Text(
              "Everyday ",
              style: const TextStyle(
                fontSize: 14,
                color: kSecBlue,
              ),
              softWrap: true,
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          size: 30,
          color: kSecBlue,
        ),
      ),
    );
  }

  Widget _buildTextDoctors() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        "Dermatologists for you ",
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
      ),
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
