import 'package:api_calling_2025/GetApi/api_services.dart';
import 'package:api_calling_2025/model/single_post_model.dart';
import 'package:flutter/material.dart';
class ScreenWithModel extends StatefulWidget {
  const ScreenWithModel({super.key});

  @override
  State<ScreenWithModel> createState() => _ScreenWithModelState();
}

class _ScreenWithModelState extends State<ScreenWithModel> {
  bool isReady = true;
  SinglePostWithModel singlePostWithModel = SinglePostWithModel();
  _getPostWithModel() {
    isReady = true;
    ApiServices().getSinglePostWithModel().then((value){

      singlePostWithModel = value!;
      isReady=false;
      setState(() {

      });


    });
  }

  @override
  void initState() {
    _getPostWithModel();
    // TODO: implement initState
    super.initState();
  }

  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: const Text("Single"),
    ),
body:  isReady==true? const Center(child: CircularProgressIndicator(),):Padding(
  padding: const EdgeInsets.all(40),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(singlePostWithModel.userId.toString(),style: const TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.red),),
      Text(singlePostWithModel.title.toString(),style: const TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.blue),),
    ],
  ),
),

      );
  }
}
