import 'package:frontenddermora/screens/chat/model/chat_response_model.dart';
import 'package:mongo_dart/mongo_dart.dart';

enum ChatMessageType { text, audio, image, video }
enum MessageStatus { not_sent, not_view, viewed }

class ChatMessage {
  final String text;
  final String chatId;
  final String timeStamp;
  final String sender;
  final bool isSender;
  final String senderImage;
  final String friendId;

  ChatMessage({
    this.text = '',
    required this.chatId,
    required this.timeStamp,
    required this.sender,
    required this.isSender,
    required this.senderImage,
    required this.friendId,
  });
}
