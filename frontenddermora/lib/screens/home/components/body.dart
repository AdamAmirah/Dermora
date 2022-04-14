// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontenddermora/screens/routine/skincare_routine.dart';
import 'package:frontenddermora/util/styles.dart';
import 'package:google_fonts/google_fonts.dart';

import './DoctorsDetails.dart';
import './cardDetails.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Map> list = [
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
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
                  // padding: EdgeInsets.symmetric(
                  //   vertical: 1.0,
                  // ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.0,
                        ),
                        child: _buildTextBeforeBanner(),
                      ),
                      SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: BannerCard(),
                      ),
                      SizedBox(height: 20.0),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.0,
                        ),
                        child: _buildTextTodaysPlan(),
                      ),
                      SizedBox(height: 20.0),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.0,
                        ),
                        child: _buildMorningRoutine(),
                      ),
                      SizedBox(height: 20.0),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.0,
                        ),
                        child: _buildNightRoutine(),
                      ),
                      SizedBox(height: 30.0),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.0,
                        ),
                        child: _buildTextDoctors(),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.0,
                        ),
                        child: DoctorsDetails(
                          list: list,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
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
            children: const [
              Text("Morning Routine ",
                  style: TextStyle(
                    fontSize: 14,
                    color: kSecBlue,
                  ),
                  softWrap: true,
                  maxLines: 3,
                  textAlign: TextAlign.center),
              SizedBox(height: 5.0),
              Text(
                "9:00 AM ",
                style: TextStyle(
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
                style: TextStyle(
                  fontSize: 14,
                  color: kSecBlue,
                ),
                softWrap: true,
                maxLines: 3,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_right,
              size: 30,
              color: kSecBlue,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RoutineScreen()),
              );
            },
          )),
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
            children: const [
              Text(
                "Night Routine ",
                style: TextStyle(
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
                style: TextStyle(
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
                style: TextStyle(
                  fontSize: 14,
                  color: kSecBlue,
                ),
                softWrap: true,
                maxLines: 3,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_right,
              size: 30,
              color: kSecBlue,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RoutineScreen()),
              );
            },
          )),
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
}
