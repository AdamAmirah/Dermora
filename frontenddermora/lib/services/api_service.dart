import 'dart:convert';

import 'package:frontenddermora/screens/auth/models/login_request_model.dart';
import 'package:frontenddermora/screens/auth/models/login_response_model.dart';
import 'package:frontenddermora/screens/auth/models/register_response_model.dart';
import 'package:frontenddermora/services/shared_service.dart';
import 'package:http/http.dart' as http;

import '../config.dart';
import '../screens/auth/models/Profile_model.dart';
import '../screens/auth/models/register_request_model.dart';

class APIService {
  static var client = http.Client();

  static Future<bool> login(LoginRequestModel model) async {
    print(jsonEncode(model.toJson()));
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.http(Config.apiURL, Config.loginAPI);
    var response = await client.post(
      url,
      // headers: requestHeaders,
      body: (model.toJson()),
    );
    if (response.statusCode == 200) {
      await SharedService.setLoginDetails(loginResponseModel(response.body));
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> register(RegisterRequestModel model) async {
    print(jsonEncode(model.toJson()));

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.registerAPI);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    if (response.statusCode == 200) {
      //shared
      return true;
    } else {
      return false;
    }
  }

  static Future<String> getArticles() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'basic ${loginDetails!.data.token}',
    };
    var url = Uri.http(Config.apiURL, Config.articlesAPI);
    var response = await client.get(
      url,
      headers: requestHeaders,
    );
    if (response.statusCode == 200) {
      //shared
      return response.body;
    } else {
      return "";
    }
  }

  static Future<Profile?> getUserData() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'basic ${loginDetails!.data.token}',
    };
    var url = Uri.http(Config.apiURL, '/user/${loginDetails.data.user.id}');
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      return convertProfileModel(response.body);
    } else {
      return null;
    }
  }

  static Future<String> getAvailableDoctors() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'basic ${loginDetails!.data.token}',
    };
    var url = Uri.http(Config.apiURL, Config.availableDoctorsAPI);
    var response = await client.get(
      url,
      headers: requestHeaders,
    );
    if (response.statusCode == 200) {
      //shared
      return response.body;
    } else {
      return "";
    }
  }
}
