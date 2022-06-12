// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:frontenddermora/screens/primary_questions/components/GenderSelector.dart';
import 'package:frontenddermora/screens/primary_questions/skin_concerns.dart';
import 'package:frontenddermora/util/styles.dart';
import '../primary_questions/components/GenderSelector.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryQuestionsScreen extends StatefulWidget {
  const PrimaryQuestionsScreen({Key? key}) : super(key: key);

  @override
  State<PrimaryQuestionsScreen> createState() => _PrimaryQuestionsScreen();
}

class _PrimaryQuestionsScreen extends State<PrimaryQuestionsScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: kSecBlue),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: <
                Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(50, 70, 0, 50),
                  child: Text(
                    "What is your gender ?",
                    style: GoogleFonts.poppins(textStyle: normalStyle),
                  ),
                ),
              ),
              GenderSelector(),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(50, 70, 0, 50),
                  child: Text(
                    "What is your age ?",
                    style: GoogleFonts.poppins(textStyle: normalStyle),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Age",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                    fillColor: Color(0xFF5974FF),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF5974FF),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 200, 0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.0, 1.0],
                        colors: [
                          Color(0xFF9DCEFF),
                          Color(0XFF92A3FD),
                        ],
                      ),
                      color: Colors.deepPurple.shade300,
                      borderRadius: BorderRadius.circular(99),
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(99.0),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all(Size(315, 60)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        // elevation: MaterialStateProperty.all(3),
                        shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SkinConcerns()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                        ),
                        child: Text(
                          "Next",
                          style: TextStyle(
                            fontSize: 18,
                            // fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}
