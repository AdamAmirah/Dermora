// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:frontenddermora/screens/auth/models/Profile_model.dart';
import 'package:frontenddermora/screens/chat/model/chat.dart';
import 'package:frontenddermora/util/styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socket_io_client/src/socket.dart';

import '../../../services/chatting_service.dart';

class ChatTextFiled extends StatefulWidget {
  ChatTextFiled({
    Key? key,
    required this.screenWidth,
    required this.socket,
    required this.chatsData,
    required this.userData,
  }) : super(key: key);

  final double screenWidth;
  final Socket socket;
  Chat chatsData;
  Profile userData;

  @override
  State<ChatTextFiled> createState() => _ChatTextFiledState();
}

class _ChatTextFiledState extends State<ChatTextFiled> {
  final TextController = TextEditingController();

  @override
  void dispose() {
    TextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
          horizontal: widget.screenWidth * 0.05,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 32,
              color: Color(0xFF087949).withOpacity(0.08),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            children: [
              Icon(
                Icons.mic,
                color: kSecBlue,
              ),
              SizedBox(
                width: widget.screenWidth * 0.01,
              ),
              Icon(
                Icons.attach_file,
                color: kSecBlue,
              ),
              SizedBox(
                width: widget.screenWidth * 0.05,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: widget.screenWidth * 0.05,
                  ),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.sentiment_satisfied_alt_outlined,
                        color: kSecBlue,
                      ),
                      SizedBox(
                        width: widget.screenWidth * 0.05,
                      ),
                      Expanded(
                        child: TextField(
                          controller: TextController,
                          decoration: InputDecoration(
                              hintText: "Type Your problems",
                              border: InputBorder.none,
                              hintStyle: GoogleFonts.abhayaLibre(fontSize: 14)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  print(TextController.text);
                  String messageText = TextController.text;

                  if (messageText != '') {
                    var messagePost = {
                      'content': messageText,
                      'chatId': widget.chatsData.chatId,
                      'sender': widget.userData.data.id,
                      "senderImage": widget.chatsData.image,
                      "friendId": widget.chatsData.friendId,
                    };
                    widget.socket.emit('sendMessage', messagePost);
                  }
                },
                icon: Icon(Icons.send),
              )
            ],
          ),
        ));
  }
}
