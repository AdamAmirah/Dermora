import 'package:flutter/material.dart';
import 'package:frontenddermora/screens/home/homepage_screen.dart';
import 'package:frontenddermora/util/styles.dart';
import 'package:google_fonts/google_fonts.dart';

class AddedProductsScreen extends StatefulWidget {
  const AddedProductsScreen({Key? key}) : super(key: key);

  @override
  State<AddedProductsScreen> createState() => _AddedProductsScreenState();
}

class _AddedProductsScreenState extends State<AddedProductsScreen> {
  List<Map> list = [
    {
      "label": "Cleanser ",
      "image": "assets/images/cleanser.png",
      "label2": "CeraVe Sa Cleanser",
    },
    {
      "label": "Toner ",
      "image": "assets/images/toner.png",
      "label2": "AHA/BHA Clarifying Treatment Toner",
    },
    {
      "label": "Treatment",
      "image": "assets/images/treatment.png",
      "label2": "Niacinamide 10% + Zinc 1%",
    },
    {
      "label": "Moisturizer",
      "image": "assets/images/Moisturizer.png",
      "label2": "CeraVe Daily Moisturizing Lotion",
    },
    {
      "label": "Sunscreen",
      "image": "assets/images/sunscreen.png",
      "label2": "3W Intensive UV Sunblock Cream SPF50+ PA+++",
    },
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
                      FlatButton(
                        onPressed: () {},
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
                    for (var ele in list)
                      Container(
                          padding: const EdgeInsets.only(right: 40, bottom: 30),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 48,
                                  ),
                                  Text(ele["label"],
                                      style: GoogleFonts.poppins(
                                        color: kBlack,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.0,
                                      )),
                                  Expanded(child: Container()),
                                  Text("Change Product",
                                      style: GoogleFonts.poppins(
                                        color: klightGrey.withOpacity(0.7),
                                        decoration: TextDecoration.underline,
                                        fontSize: 12.0,
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Icon(Icons.delete_outline_rounded, size: 35),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                          offset: const Offset(4, 4),
                                          blurRadius: 5,
                                          color: klightGrey.withOpacity(.3),
                                        )
                                      ],
                                    ),
                                    child: Image.asset(
                                      ele["image"],
                                      height: 50,
                                      width: 50,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Flexible(
                                    child: Container(
                                        padding:
                                            const EdgeInsets.only(right: 50),
                                        child: Text(ele["label2"],
                                            style: GoogleFonts.poppins(
                                              color:
                                                  klightGrey.withOpacity(0.6),
                                              fontSize: 12.0,
                                            ))),
                                  )
                                ],
                              )
                            ],
                          )),
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
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () => {},
                                icon: const Icon(
                                  Icons.add,
                                ),
                                color: Color(0xF04967FF),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Add new steps",
                                  style: GoogleFonts.poppins(
                                    color: Color(0xF04967FF),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.0,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Remind me to do routine",
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                            )),
                        Switch.adaptive(
                          thumbColor: MaterialStateProperty.all(Colors.white),
                          trackColor: MaterialStateProperty.all(Colors.grey),

                          // activeColor: Colors.blueAccent,
                          // activeTrackColor: Colors.blue.withOpacity(0.4),
                          // inactiveThumbColor: Colors.orange,
                          // inactiveTrackColor: Colors.black87,
                          splashRadius: 50,
                          value: value,
                          onChanged: (value) =>
                              setState(() => this.value = value),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
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
