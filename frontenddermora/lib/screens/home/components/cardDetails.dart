import 'package:flutter/material.dart';
import 'package:frontenddermora/util/styles.dart';
import 'package:google_fonts/google_fonts.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          CardDetails(
            image: "assets/images/image_banner_1.png",
            title: "Follow the latest blog on healthy food options",
            press: () {},
          ),
          CardDetails(
            image: "assets/images/image_banner_2.png",
            title: "Did you know that kiwis have more vitamin C than oranges?",
            press: () {},
          ),
          CardDetails(
            image: "assets/images/image_banner_3.png",
            title: "7 facial yoga exercises or poses",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class CardDetails extends StatelessWidget {
  const CardDetails({
    Key? key,
    required this.image,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String image, title;

  final Function press;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        height: 150,
        width: 270,
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 10.0,
        ),
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
          borderRadius: BorderRadius.circular(20),
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 10,
              color: klightGrey.withOpacity(.8),
            )
          ],
        ),
        child: Column(
          children: [
            Flexible(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: Text(
                        "$title\n",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                    Flexible(child: Image.asset(image)),
                  ],
                ),
              ),
            ),
          ],
          /*FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: kBlue,
            onPressed: (){},
            child: Text(
              "Read More",
              style: TextStyle(color: Colors.white),
            ),
          ),*/
        ));
  }
}
