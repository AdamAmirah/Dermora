// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:frontenddermora/util/styles.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/body.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      elevation: 0,
      toolbarHeight: screenWidth * 0.2,
      leading: Padding(
        padding: EdgeInsets.only(top: screenWidth * 0.1),
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: kSecBlue),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      title: Padding(
        padding: EdgeInsets.only(top: screenWidth * 0.1),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/avatar.png"),
              radius: 20,
            ),
            SizedBox(
              width: screenWidth * 0.05,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dr  Mohamed Ahmed",
                  style: GoogleFonts.abhayaLibre(
                      color: Colors.black, fontSize: 20),
                ),
                Row(
                  children: [
                    Text(
                      "Time Remaining: ",
                      style: GoogleFonts.abhayaLibre(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "56s",
                      style: GoogleFonts.roboto(
                        color: Colors.green,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}