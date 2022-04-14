import 'package:flutter/material.dart';
import 'package:frontenddermora/screens/routine/Added_products.dart';
import 'package:frontenddermora/util/styles.dart';
import 'package:google_fonts/google_fonts.dart';

class RoutineScreen extends StatefulWidget {
  const RoutineScreen({Key? key}) : super(key: key);

  @override
  State<RoutineScreen> createState() => _RoutineScreenState();
}

class _RoutineScreenState extends State<RoutineScreen> {
  List<Map> list = [
    {
      "label": "Cleanser ",
    },
    {
      "label": "Toner ",
    },
    {
      "label": "Treatment",
    },
    {
      "label": "Moisturizer",
    },
    {
      "label": "Sunscreen",
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
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                      ),

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
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const AddedProductsScreen()),
                          );
                        },
                        child: Text("Create",
                            style: GoogleFonts.poppins(
                              color: kSecBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
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
                    for (var ele in list)
                      Container(
                          padding: const EdgeInsets.only(bottom: 30),
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
                                        fontSize: 16.0,
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
                                      gradient: const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        stops: [0.0, 1.0],
                                        colors: [
                                          Color(0xF04967FF),
                                          Color(0xFF8CC1F7),
                                        ],
                                      ),
                                      color: Colors.deepPurple.shade300,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                          offset: const Offset(4, 4),
                                          blurRadius: 5,
                                          color: klightGrey.withOpacity(.3),
                                        )
                                      ],
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Text("Add your Product",
                                      style: GoogleFonts.poppins(
                                        color: klightGrey.withOpacity(0.6),
                                        fontSize: 14.0,
                                      ))
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
