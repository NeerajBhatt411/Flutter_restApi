import 'dart:convert';

import 'package:api_calling_2025/MultiplePostListAPI/screen_with_model_List.dart';
import 'package:api_calling_2025/model/multidata_complex_api.dart';
import 'package:api_calling_2025/model/multiple_post_list_model.dart';
import 'package:api_calling_2025/model/single_post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  // Single Post Api with model

  Future<SinglePostWithModel?> getSinglePostWithModel() async {
    try {
      var response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));
      if (response.statusCode == 200) {
        SinglePostWithModel model =
            SinglePostWithModel.fromJson(jsonDecode(response.body));
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  // Single Post Api without Model

  Future<dynamic> getSinglePostWithoutModel() async {
    try {
      var response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));
      if (response.statusCode == 200) {
        var Data = jsonDecode(response.body);
        return Data;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // Multiple Post (List API) with model

  Future<List<multiplePostList>?> getListWithModel() async {
    try {
      var response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      if (response.statusCode == 200) {
        List<multiplePostList> model = List<multiplePostList>.from(
            jsonDecode(response.body).map((x) => multiplePostList.fromJson(x)));
        return model;
      }
    } catch (e) {
      e.toString();
    }

    return null;
  }

  // Multiple Post (List API) without Model

  Future<dynamic> getListWithoutModel() async {
    try {
      var response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      if (response.statusCode == 200) {
       var data = jsonDecode(response.body);
        return data ;
      }
    } catch (e) {
      e.toString();
    }

    return null;
  }


  // complex API Calling with model  ye api mai pehle start hoga object say phir list h and uska andar objects h
 
  Future<MultiData?> getMultiDataWithModel() async {
    try{
      var response = await http.get(Uri.parse("https://reqres.in/api/unkown"));
      if(response.statusCode==200){
        MultiData model = MultiData.fromJson(jsonDecode(response.body));
        return model;
      }
    }
    catch(e){
      print(e.toString());
    }
    return null;


  }

// complex API Calling with model  ye api mai pehle start hoga object say phir list h and uska andar objects h
  Future<dynamic> getMultiDataWithoutModel() async {
    try{
      var response = await http.get(Uri.parse("https://reqres.in/api/unkown"));
      if(response.statusCode==200){
        var model = json.decode(response.body);
        return model;
      }
    }
    catch(e){
      print(e.toString());
    }
    return null;


  }

}
