// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontenddermora/services/chatting_service.dart';
import 'package:frontenddermora/util/styles.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorsDetails extends StatefulWidget {
  DoctorsDetails({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List<Map> list;

  @override
  State<DoctorsDetails> createState() => _DoctorsDetailsState();
}

class _DoctorsDetailsState extends State<DoctorsDetails> {
  bool isAnotherDoctorBooked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (var ele in widget.list)
            Container(
              padding: const EdgeInsets.all(0),
              margin: EdgeInsets.symmetric(vertical: 8),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(0),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(13)),
                        child: Container(
                          height: 55,
                          width: 55,
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
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            ele["image"],
                            height: 50,
                            width: 50,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      title: Text(
                        ele["label"],
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      subtitle: Text(
                        ele["Key"],
                        style:
                            TextStyle(color: Color(0xFF8F8F8F), fontSize: 10),
                      ),
                      trailing: ele["isRequestSent"]
                          ? ElevatedButton(
                              onPressed:
                                  ele["isRequestAccepted"] ? () {} : null,
                              style: ButtonStyle(
                                backgroundColor: ele["isRequestAccepted"]
                                    ? MaterialStateProperty.all(kSecBlue)
                                    : ele["isRequestDenied"]
                                        ? MaterialStateProperty.all(
                                            Colors.transparent)
                                        : MaterialStateProperty.all(
                                            Colors.transparent),
                              ),
                              child: ele["isRequestAccepted"]
                                  ? Text(
                                      "Start Chatting",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 10),
                                    )
                                  : ele["isRequestDenied"]
                                      ? Text(
                                          "Request Denied",
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 10),
                                        )
                                      : Text(
                                          "Wait..",
                                          style: TextStyle(
                                            color: Colors.grey[400],
                                            fontSize: 10,
                                          ),
                                        ),
                            )
                          : isAnotherDoctorBooked
                              ? Text("")
                              : IconButton(
                                  icon: Icon(Icons.keyboard_arrow_right),
                                  iconSize: 30,
                                  color: Theme.of(context).primaryColor,
                                  onPressed: () async {
                                    setState(() {
                                      ele["isRequestSent"] = true;
                                      isAnotherDoctorBooked = true;
                                    });
                                    // print("sdfasafsd");
                                    // String message =
                                    //     await APIChatService.createChat(json.encode({
                                    //   "userId": ele["userId"],
                                    //   "userImage": ele["userImage"],
                                    //   "userName": ele["userName"],
                                    //   "id": ele["id"],
                                    //   "image": ele["image"],
                                    //   "name": ele["name"],
                                    // }));

                                    // print(message);
                                  },
                                ),
                    ),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
