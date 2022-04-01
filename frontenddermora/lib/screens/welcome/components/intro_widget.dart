import 'package:flutter/material.dart';
import 'package:frontenddermora/util/styles.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroWidget extends StatelessWidget {
  final double screenWidth;
  final double screenheight;
  final image;
  final type;
  final secImage;
  final Color startGradientColor;
  final Color endGradientColor;
  final String subText;

  IntroWidget({
    required this.screenWidth,
    required this.screenheight,
    required this.image,
    required this.secImage,
    required this.type,
    required this.startGradientColor,
    required this.endGradientColor,
    required this.subText,
  });

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = LinearGradient(
      colors: <Color>[startGradientColor, endGradientColor],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    return Container(
      padding: EdgeInsets.only(top: 25),
      decoration: BoxDecoration(color: kwhite),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            secImage,
            width: screenWidth * 0.6,
            height: screenheight * 0.1,
            fit: BoxFit.contain,
          ),
          Image.asset(
            image,
            width: screenWidth * 0.9,
            height: screenheight * 0.5,
            fit: BoxFit.contain,
          ),
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: <Widget>[
              Text(
                type.toString().toUpperCase(),
                style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.w900,
                    foreground: Paint()..shader = linearGradient),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(30),
            child: Text(
              subText,
              textAlign: TextAlign.center,
              style: GoogleFonts.dmSans(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle buildTextStyle(double size) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w900,
      height: 0.5,
    );
  }
}
