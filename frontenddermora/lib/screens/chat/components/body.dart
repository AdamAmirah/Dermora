// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:frontenddermora/screens/chat/model/chat.dart';
import 'package:frontenddermora/screens/messages/message_screen.dart';
import 'package:frontenddermora/util/styles.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../../../config.dart';
import '../../../services/chatting_service.dart';
import 'chat_card.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late Socket socket; //initalize the Socket.IO Client Object

  @override
  void initState() {
    super.initState();
    initializeSocket(); //--> call the initializeSocket method in the initState of our app.
  }

  @override
  void dispose() {
    socket
        .disconnect(); // --> disconnects the Socket.IO client once the screen is disposed
    super.dispose();
  }

  void initializeSocket() {
    socket = io("http://10.0.2.2:3000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect(); //connect the Socket.IO Client to the Server

    //SOCKET EVENTS
    // --> listening for connection
    socket.on('connect', (data) {
      print(socket.connected);
    });

    //listen for incoming messages from the Server.
    socket.on('message', (data) {
      print(data); //
    });

    //listens when the client is disconnected from the Server
    socket.on('disconnect', (data) {
      print('disconnect');
    });
  }

  // Socket socket = io('http://localhost  :3000', <String, dynamic>{
  //   "transports": ["websocket"],
  //   "autoConnect": false,
  // }); //initalize the Socket.IO Client Object

  // @override
  // void initState() {
  //   super.initState();
  //   connectToServer(
  //       socket); //--> call the initializeSocket method in the initState of our app.
  // }

  // @override
  // void dispose() {
  //   socket
  //       .disconnect(); // --> disconnects the Socket.IO client once the screen is disposed
  //   super.dispose();
  // }

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
