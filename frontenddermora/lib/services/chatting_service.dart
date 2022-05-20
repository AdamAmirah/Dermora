import 'package:socket_io_client/socket_io_client.dart';
import '../config.dart';

import 'dart:convert';

import 'package:frontenddermora/services/shared_service.dart';
import 'package:http/http.dart' as http;

import '../screens/chat/model/chat_response_model.dart';
import '../screens/messages/components/body.dart';
import '../screens/messages/models/messages.dart';

class APIChatService {
  static var client = http.Client();
  static Future<ChatResponseModel?> getChat(chatId) async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'basic ${loginDetails!.data.token}',
    };

    var url = Uri.http(Config.apiURL, 'chat/${chatId}');
    var response = await client.get(
      url,
      headers: requestHeaders,
    );
    if (response.statusCode == 200) {
      //shared'
      return ChatModelConverter(response.body);
    } else {
      return null;
    }
  }

  static Future<String> createChat(data) async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'basic ${loginDetails!.data.token}',
    };

    var url = Uri.http(Config.apiURL, Config.createChatAPI);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: data,
    );
    if (response.statusCode == 200) {
      //shared'
      return "success";
    } else {
      return "No";
    }
  }

  static dynamic sendBackData(data) {
    return data;
  }
}

void initializeSocket(socket, cb) {
  //SOCKET EVENTS
  // --> listening for connection
  socket.on('connect', (data) {
    print("client is connected to the socket");
    print(socket.connected);
  });

  //listen for incoming messages from the Server.
  socket.on('newMessage', (ChatMessage data) {
    print(" fffffffffffffffffffff4");
    print(data);
    cb(data);
  });

  //listens when the client is disconnected from the Server
  socket.on('disconnect', (data) {
    print('disconnect');
  });
}
