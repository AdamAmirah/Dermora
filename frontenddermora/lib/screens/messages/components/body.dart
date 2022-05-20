// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:frontenddermora/screens/auth/models/Profile_model.dart';
import 'package:frontenddermora/screens/chat/model/chat.dart';
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
  const Body({Key? key, required this.userData, required this.chatsData})
      : super(key: key);

  final Profile userData;
  final Chat chatsData;
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late Socket socket; //initalize the Socket.IO Client Object
  List<ChatMessage> chatMessages = [];
  @override
  void initState() {
    super.initState();
    _get();
    socket = io("http://192.168.243.180:3000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });

    socket.connect(); //connect the Socket.IO Client to the Server
    initializeSocket(socket, setMessages);
    socket.emit('joinChat', widget.chatsData.chatId);
  }

  _get() async {
    ChatResponseModel? chatData =
        await APIChatService.getChat(widget.chatsData.chatId);

    setState(() {
      for (var element in chatData!.messages) {
        Users senderImage =
            element.chat.users.singleWhere((e) => e.id == element.sender);

        chatMessages.add(
          ChatMessage(
            text: element.content,
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(chatMessages[0]);
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.08, vertical: 30),
            child: ListView.builder(
              itemCount: chatMessages.length,
              itemBuilder: (context, index) =>
                  Message(message: chatMessages[index]),
            ),
          ),
        ),
        ChatTextFiled(
            screenWidth: screenWidth,
            socket: socket,
            chatsData: widget.chatsData,
            userData: widget.userData),
      ],
    );
  }

  void setMessages(data) {
    setState(() {
      chatMessages.add(ChatMessage(
        text: data.content,
        chatId: data.chatId,
        timeStamp: data.timestamp,
        sender: data.sender,
        isSender: data.sender == widget.userData.data.id,
        senderImage: data.senderImage,
        friendId: data.friendId,
      ));
    });
  }
}
