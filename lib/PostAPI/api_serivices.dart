import 'dart:convert';

import 'package:api_calling_2025/model/login_success.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<LoginSuccess?> getLoginWithModel(String email, String password) async {
    try {
      var response = await http.post(Uri.parse("https://reqres.in/api/login"),
          body: {"email": email, "password": password});
      if (response.statusCode == 200) {
        LoginSuccess model = LoginSuccess.fromJson(jsonDecode(response.body));
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<dynamic> getLoginWithoutModel(String email, String password) async {
    try {
      var response = await http.post(Uri.parse("https://reqres.in/api/login"),
          body: {"email": email, "password": password});
      if (response.statusCode == 200) {
       var  model = jsonDecode(response.body);
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
