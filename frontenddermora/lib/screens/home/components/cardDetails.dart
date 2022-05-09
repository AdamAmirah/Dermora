// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:frontenddermora/util/styles.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../services/api_service.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //   builder: (BuildContext context, AsyncSnapshot<String> model) {
    //     if (model.hasData) {
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
    // }
    //     return const Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   },
    //   future: APIService.getArticles(),
    // );
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
      height: 160,
      width: 270,
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 10.0,
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 1.0],
          colors: [
            Color(0XFFa594f9),
            Color(0xFFa1bafe),
          ],
        ),
        color: Colors.deepPurple.shade300,
        borderRadius: BorderRadius.circular(20),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: const Offset(4, 4),
            blurRadius: 5,
            color: klightGrey.withOpacity(.3),
          )
        ],
      ),
      child: Row(
        children: [
          Flexible(
            child: Column(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 8.0),
                    child: Flexible(
                      child: Text(
                        "$title\n",
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ),
                  ),
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.white,
                  onPressed: () {},
                  child: const Text(
                    "Read More",
                    style: TextStyle(color: kSecBlue),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 120,
            height: 120,
            child: Flexible(
              child: Image.asset(
                image,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
