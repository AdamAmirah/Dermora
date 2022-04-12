// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:frontenddermora/util/styles.dart';

import '../model/profile.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({
    Key? key,
    required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    "assets/images/rectangle.png",
                    width: screenWidth * 0.49,
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding: EdgeInsets.all(screenWidth * 0.09),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/profile.png",
                          width: screenWidth * 0.3,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Furqan Said",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: demoProfile.length,
                    itemBuilder: (context, index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            demoProfile[index].label,
                            style: normalStyleBlack,
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            demoProfile[index].text,
                            style: normalStyle,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
