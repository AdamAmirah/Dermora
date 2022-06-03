// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:frontenddermora/screens/auth/models/Profile_model.dart';
import 'package:frontenddermora/screens/chat/model/chat.dart';
import 'package:frontenddermora/util/styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

import '../../services/chatting_service.dart';
import '../chat/model/chatInfo_response_model.dart';
import 'components/body.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen(
      {Key? key, required this.userData, required this.chatsData})
      : super(key: key);

  final Profile userData;
  final Chat chatsData;

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  ChatInfo? chatInfo;
  String remainingTime = "Chat Did not start yet";
  bool closeChat = false;
  @override
  void initState() {
    _get();
    if (chatInfo != null && !chatInfo!.data.isClosed) {
      Timer.periodic(const Duration(seconds: 10), (Timer timer) {
        // _get();
        var end = DateTime.parse(chatInfo!.data.endTime);
        var start = DateTime.parse(chatInfo!.data.startTime);
        var now = DateTime.now();

        if (chatInfo!.data.isStarted) {
          var dif = end.difference(now);
          setState(() {
            remainingTime = dif.inMinutes.toString();
          });
        }
        if (now.isAfter(end)) {
          timer.cancel();
          setState(() {
            _updateStatus();
            remainingTime = "Time is up";
            closeChat = true;
          });
        }
      });
    }
    super.initState();
  }

  _updateStatus() async {
    var cData = await APIChatService.updateChatStatus(widget.chatsData.chatId);
  }

  _get() async {
    ChatInfo? cData = await APIChatService.getChatInfo(widget.chatsData.chatId);
    var end = DateTime.parse(cData!.data.endTime);
    var start = DateTime.parse(cData.data.startTime);
    var now = DateTime.now();

    setState(() {
      chatInfo = cData;
    });
    if (cData.data.isStarted) {
      var dif = end.difference(now);
      setState(() {
        if (!cData.data.isClosed)
          remainingTime = dif.inMinutes.toString();
        else
          remainingTime = "";

        closeChat = cData.data.isClosed;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(
          chatsData: widget.chatsData,
          userData: widget.userData,
          closeChat: closeChat),
    );
  }

  AppBar buildAppBar() {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      elevation: 0,
      toolbarHeight: screenWidth * 0.2,
      leading: Padding(
        padding: EdgeInsets.only(top: screenWidth * 0.1),
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: kSecBlue),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      title: Padding(
        padding: EdgeInsets.only(top: screenWidth * 0.1),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.chatsData.image),
              radius: 20,
            ),
            SizedBox(
              width: screenWidth * 0.05,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dr  ${widget.chatsData.name}",
                  style: GoogleFonts.abhayaLibre(
                      color: Colors.black, fontSize: 20),
                ),
                Row(
                  children: [
                    Text(
                      closeChat ? "" : "Time Remaining: ",
                      style: GoogleFonts.abhayaLibre(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      remainingTime,
                      style: GoogleFonts.roboto(
                        color: Colors.green,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
