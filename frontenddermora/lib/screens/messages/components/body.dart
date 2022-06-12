// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontenddermora/screens/auth/models/Profile_model.dart';
import 'package:frontenddermora/screens/chat/model/chat.dart';
import 'package:frontenddermora/screens/chat/model/chatInfo_response_model.dart';
import 'package:frontenddermora/screens/chat/model/chat_response_model.dart';
import 'package:frontenddermora/screens/messages/components/chat_textField.dart';
import 'package:frontenddermora/screens/messages/components/message.dart';
import 'package:frontenddermora/screens/messages/models/messages.dart';
import 'package:frontenddermora/util/styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../../../services/api_service.dart';
import '../../../services/chatting_service.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
    required this.userData,
    required this.chatsData,
    required this.closeChat,
  }) : super(key: key);

  final Profile userData;
  final Chat chatsData;
  final bool closeChat;
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late Socket socket; //initalize the Socket.IO Client Object
  List<ChatMessage> chatMessages = [];
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _get();

    WidgetsBinding.instance?.addPostFrameCallback((_) => {
          _controller.animateTo(
            0.0,
            duration: Duration(milliseconds: 200),
            curve: Curves.easeIn,
          )
        });
    socket = io("https://dermora.herokuapp.com/", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });

    socket.connect(); //connect the Socket.IO Client to the Server
    initializeSocket();
    socket.emit('joinChat', widget.chatsData.chatId);
  }

  void initializeSocket() {
    //SOCKET EVENTS
    // --> listening for connection
    socket.on('connect', (data) {
      print("client is connected to the socket");
      print(socket.connected);
    });

    //listen for incoming messages from the Server.
    socket.on('newMessage', (info) {
      setState(() {
        chatMessages.add(ChatMessage(
          content: info["content"],
          chatId: info["chatId"],
          timeStamp: info["timestamp"],
          sender: info["sender"],
          isSender: info["sender"] == widget.userData.data.id,
          senderImage: info["senderImage"],
          friendId: info["friendId"],
        ));
      });
    });

    //listens when the client is disconnected from the Server
    socket.on('disconnect', (data) {
      print('disconnect');
    });
  }

  _get() async {
    print(widget.chatsData.chatId);
    ChatResponseModel? chatData =
        await APIChatService.getChat(widget.chatsData.chatId);

    setState(() {
      for (var element in chatData!.messages) {
        Users senderImage =
            element.chat.users.singleWhere((e) => e.id == element.sender);

        chatMessages.add(
          ChatMessage(
            content: element.content,
            chatId: element.chat.id,
            timeStamp: element.timestamp,
            sender: element.sender,
            isSender: element.sender == widget.userData.data.id,
            senderImage: senderImage.image,
            friendId: chatData.friendData.id,
          ),
        );
        print(chatMessages[0]);
      }
    });
  }

  @override
  void dispose() {
    socket
        .disconnect(); // --> disconnects the Socket.IO client once the screen is disposed
    socket.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.08, vertical: 30),
            child: ListView.builder(
              controller: _controller,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              reverse: true,
              cacheExtent: 1000,
              itemCount: chatMessages.length,
              itemBuilder: (context, index) => Message(
                  message: chatMessages[chatMessages.length - index - 1],
                  image: widget.chatsData.image),
            ),
          ),
        ),
        widget.closeChat
            ? Text("")
            : ChatTextFiled(
                screenWidth: screenWidth,
                socket: socket,
                chatsData: widget.chatsData,
                userData: widget.userData),
      ],
    );
  }
}
