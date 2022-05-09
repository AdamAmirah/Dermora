import 'dart:convert';

LoginResponseModel loginResponseModel(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  LoginResponseModel({
    required this.message,
    required this.data,
  });
  late final String message;
  late final Data data;

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.user,
    required this.token,
  });
  late final User user;
  late final String token;

  Data.fromJson(Map<String, dynamic> json) {
    user = User.fromJson(json['user']);
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user'] = user.toJson();
    _data['token'] = token;
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.email,
    required this.fullName,
    required this.password,
    required this.image,
    required this.kind,
    required this.address,
    required this.doctorInfo,
    required this.userInfo,
    required this.friends,
    required this.v,
  });
  late final String id;
  late final String email;
  late final String fullName;
  late final String password;
  late final String image;
  late final String kind;
  late final List<dynamic> address;
  late final List<dynamic> doctorInfo;
  late final List<dynamic> userInfo;
  late final List<dynamic> friends;
  late final int v;

  User.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    email = json['email'];
    fullName = json['fullName'];
    password = json['password'];
    image = json['image'];
    kind = json['kind'];
    address = List.castFrom<dynamic, dynamic>(json['address']);
    doctorInfo = List.castFrom<dynamic, dynamic>(json['doctorInfo']);
    userInfo = List.castFrom<dynamic, dynamic>(json['userInfo']);
    friends = List.castFrom<dynamic, dynamic>(json['friends']);
    v = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['email'] = email;
    _data['fullName'] = fullName;
    _data['password'] = password;
    _data['image'] = image;
    _data['kind'] = kind;
    _data['address'] = address;
    _data['doctorInfo'] = doctorInfo;
    _data['userInfo'] = userInfo;
    _data['friends'] = friends;
    _data['__v'] = v;

    return _data;
  }
}
