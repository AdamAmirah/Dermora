import 'dart:convert';

ChatResponseModel ChatModelConverter(String str) =>
    ChatResponseModel.fromJson(json.decode(str));

class ChatResponseModel {
  ChatResponseModel({
    required this.messages,
    required this.friendData,
    required this.chatId,
  });
  late final List<Messages> messages;
  late final FriendData friendData;
  late final String chatId;

  ChatResponseModel.fromJson(Map<String, dynamic> json) {
    messages =
        List.from(json['messages']).map((e) => Messages.fromJson(e)).toList();
    friendData = FriendData.fromJson(json['friendData']);
    chatId = json['chatId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['messages'] = messages.map((e) => e.toJson()).toList();
    _data['friendData'] = friendData.toJson();
    _data['chatId'] = chatId;
    return _data;
  }
}

class Messages {
  Messages({
    required this.id,
    required this.chat,
    required this.sender,
    required this.content,
    required this.timestamp,
    required this.v,
  });
  late final String id;
  late final Chats chat;
  late final String sender;
  late final String content;
  late final String timestamp;
  late final int v;

  Messages.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    chat = Chats.fromJson(json['chat']);
    sender = json['sender'];
    content = json['content'];
    timestamp = json['timestamp'];
    v = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['chat'] = chat.toJson();
    _data['sender'] = sender;
    _data['content'] = content;
    _data['timestamp'] = timestamp;
    _data['__v'] = v;
    return _data;
  }
}

class Chats {
  Chats({
    required this.id,
    required this.users,
    required this.v,
  });
  late final String id;
  late final List<Users> users;
  late final int v;

  Chats.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    users = List.from(json['users']).map((e) => Users.fromJson(e)).toList();
    v = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['users'] = users.map((e) => e.toJson()).toList();
    _data['__v'] = v;
    return _data;
  }
}

class Users {
  Users({
    required this.id,
    required this.image,
  });
  late final String id;
  late final String image;

  Users.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['image'] = image;
    return _data;
  }
}

class FriendData {
  FriendData({
    required this.id,
    required this.image,
  });
  late final String id;
  late final String image;

  FriendData.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['image'] = image;
    return _data;
  }
}
