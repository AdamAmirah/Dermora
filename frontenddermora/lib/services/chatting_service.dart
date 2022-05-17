import 'package:socket_io_client/socket_io_client.dart';
import '../config.dart';

void connectToServer(socket) {
  try {
    socket.connect(); //connect the Socket.IO Client to the Server

    print("&&&&&&&&&&&&&&&&&&&&&&&&&");
    print(socket.connected);
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

    sendMessage(String message, username) {
      socket.emit(
        "message",
        {
          "id": socket.id,
          "message": message, //--> message to be sent
          "username": username,
          "sentAt": DateTime.now().toLocal().toString().substring(0, 16),
        },
      );
    }
  } catch (e) {
    print(e.toString());
  }
}
