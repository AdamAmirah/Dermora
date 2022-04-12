// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:frontenddermora/screens/messages/components/text_message.dart';
import 'package:frontenddermora/screens/messages/models/messages.dart';
import 'package:frontenddermora/util/styles.dart';

class Message extends StatelessWidget {
  const Message({
    Key? key,
    required this.message,
  }) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    Widget messageContaint(ChatMessage message) {
      switch (message.messageType) {
        case ChatMessageType.text:
          return TextMessage(message: message);
        default:
          return SizedBox();
      }
    }

    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Row(
        mainAxisAlignment:
            message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isSender) ...[
            CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage("assets/images/user.png"),
            ),
            SizedBox(width: screenWidth * 0.05),
          ],
          messageContaint(message),
          if (message.isSender) MessageStatusDot(status: message.messageStatus)
        ],
      ),
    );
  }
}

class MessageStatusDot extends StatelessWidget {
  final MessageStatus? status;

  const MessageStatusDot({Key? key, this.status}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    Color dotColor(MessageStatus status) {
      switch (status) {
        case MessageStatus.not_sent:
          return Colors.red.withOpacity(0.64);
        case MessageStatus.not_view:
          return kSecBlue.withOpacity(0.64);
        case MessageStatus.viewed:
          return kSecBlue;

        default:
          return Colors.transparent;
      }
    }

    return Container(
      margin: EdgeInsets.only(left: screenWidth * 0.03),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: dotColor(status!),
        shape: BoxShape.circle,
      ),
      child: Icon(
        status == MessageStatus.not_sent ? Icons.close : Icons.done,
        size: 8,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}
