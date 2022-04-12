// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:frontenddermora/screens/primary_questions/components/reusableButton.dart';
import 'package:frontenddermora/util/styles.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../primary_questions/models/concerns.dart';
import 'button.dart';
import 'profile_data.dart';
import 'profile_details.dart';
import 'skin_concerns.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    List<Concern> concerns = [
      Concern("Acne & Blemishes", false),
      Concern("Uneven Texture", false),
      Concern("Dark Circles", false),
      Concern("Anti-Aging", false),
      Concern("Fine Lines & Wrinkles", false),
    ];
    List<Map> list = [
      {
        "image": "assets/images/moon.png",
        "amount": "0",
        "label": "Evening logs"
      },
      {
        "image": "assets/images/sun.png",
        "amount": "0",
        "label": "Morning logs"
      },
      {"image": "assets/images/cream.png", "amount": "0", "label": "Routines"},
    ];

    return Column(
      children: [
        ProfileDetails(screenWidth: screenWidth),
        ProfileData(screenWidth: screenWidth, list: list),
        SkinConcerns(screenWidth, concerns)
      ],
    );
  }
}
