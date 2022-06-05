// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:frontenddermora/screens/home/homepage_screen.dart';
import 'package:frontenddermora/screens/routine/components/single_product.dart';
import 'package:frontenddermora/screens/routine/components/edit_routine.dart';
import 'package:frontenddermora/util/styles.dart';
import 'package:google_fonts/google_fonts.dart';

class AddedProductsScreen extends StatefulWidget {
  const AddedProductsScreen({Key? key}) : super(key: key);

  @override
  State<AddedProductsScreen> createState() => _AddedProductsScreenState();
}

class _AddedProductsScreenState extends State<AddedProductsScreen> {
  @override
  void reomveItem(ele, label, index) => {
        setState(() {
          list[index][label].remove(ele);
        })
        //TODO
        ////update the db
      };

  void addItem(product, label) => {
        setState(() {
          for (int i = 0; i < list.length; i++) {
            if (list[i]["label"]! == label) {
              list[i][label]!.add(product);
            }
          }
        }),
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            title: Text("Success"),
            titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
            actionsOverflowButtonSpacing: 20,
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Close"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kSecBlue)),
              ),
            ],
            content: Text("Saved successfully"),
          ),
        ),
        //TODO
        ////update the db
      };

  List<Map<String, dynamic>> list = [
    {
      'label': "Cleanser",
      'Cleanser': [
        {"image": "assets/images/cleanser.png", "label": "CeraVe Sa Cleanser"},
        {"image": "assets/images/cleanser.png", "label": "CeraVe Sa Cleanser"},
        {"image": "assets/images/cleanser.png", "label": "CeraVe Sa Cleanser"}
      ],
    },
    {
      'label': "Toner",
      "Toner": [
        {
          "image": "assets/images/toner.png",
          "label": "AHA/BHA Clarifying Treatment Toner"
        },
        {
          "image": "assets/images/toner.png",
          "label": "AHA/BHA Clarifying Treatment Toner"
        },
        {
          "image": "assets/images/toner.png",
          "label": "AHA/BHA Clarifying Treatment Toner"
        },
      ],
    },
    {
      'label': "Treatment",
      "Treatment": [
        {
          "image": "assets/images/treatment.png",
          "label": "Niacinamide 10% + Zinc 1%"
        },
        {
          "image": "assets/images/treatment.png",
          "label": "Niacinamide 10% + Zinc 1%"
        },
        {
          "image": "assets/images/treatment.png",
          "label": "Niacinamide 10% + Zinc 1%"
        },
      ],
    },
    {
      'label': "Moisturizer",
      "Moisturizer": [
        {
          "image": "assets/images/Moisturizer.png",
          "label": "CeraVe Daily Moisturizing Lotion"
        },
        {
          "image": "assets/images/Moisturizer.png",
          "label": "CeraVe Daily Moisturizing Lotion"
        },
        {
          "image": "assets/images/Moisturizer.png",
          "label": "CeraVe Daily Moisturizing Lotion"
        },
      ],
    },
    {
      'label': "Sunscreen",
      "Sunscreen": [
        {
          "image": "assets/images/sunscreen.png",
          "label": "CeraVe Sa Cleanser",
        },
        {
          "image": "assets/images/sunscreen.png",
          "label": "CeraVe Sa Cleanser",
        },
        {
          "image": "assets/images/sunscreen.png",
          "label": "CeraVe Sa Cleanser",
        },
      ],
    }
  ];

  bool value = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xF04967FF),
              Color(0xFF8CC1F7),
            ],
            begin: const FractionalOffset(0.0, 0.4),
            end: Alignment.topRight,
          ),
        ),
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.only(top: 60, left: 30, right: 30),
                width: MediaQuery.of(context).size.width,
                height: 150,
                child: Column(
                  children: [
                    Row(children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePageScreen()),
                            );
                          },
                          icon: Icon(Icons.arrow_back, color: Colors.white)),
                      Expanded(child: Container()),
                      //SizedBox(width: 20),
                      Text('Mornig Routine',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          )),
                      Expanded(child: Container()),
                      ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(99.0),
                            ),
                          ),
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
                                builder: (context) =>
                                    EditRoutineListScreen(addItem: addItem)),
                          );
                        },
                        child: Text("Edit",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                            )),
                      ),
                    ]),
                  ],
                )),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(70))),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 30, right: 10, bottom: 30),
                      child: Row(
                        children: [
                          Text("5 Steps",
                              style: GoogleFonts.poppins(
                                color: kBlack,
                                fontWeight: FontWeight.w700,
                                fontSize: 18.0,
                              )),
                        ],
                      ),
                    ),
                    for (int i = 0; i < list.length; i++)
                      SingleProduct(
                          label: list[i]["label"],
                          products: list[i][list[i]["label"]],
                          index: i,
                          remove: reomveItem),
                    Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      width: 270,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            offset: Offset(4, 4),
                            blurRadius: 10,
                            color: Color(0xFFB8BFCE).withOpacity(.2),
                          ),
                          BoxShadow(
                            offset: Offset(-3, 0),
                            blurRadius: 15,
                            color: Color(0xFFB8BFCE).withOpacity(.1),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
