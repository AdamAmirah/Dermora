// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:frontenddermora/screens/chat/model/chat.dart';
import 'package:frontenddermora/screens/messages/message_screen.dart';
import 'package:frontenddermora/util/styles.dart';

import 'chat_card.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05, vertical: 50),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.1,
                      ),
                      Icon(
                        Icons.search_outlined,
                        color: kSecBlue,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: screenWidth * 0.05,
              ),
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/avatar.png"),
                radius: 29,
              )
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: chatsData.length,
            itemBuilder: (context, index) => ChatCard(
                chat: chatsData[index],
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MessagesScreen()),
                  );
                }),
          ),
        )
      ],
    );
  }
}
