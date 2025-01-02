import 'package:api_calling_2025/api/api_services.dart';
import 'package:flutter/material.dart';
class ScreenWithoutModel extends StatefulWidget {
  const ScreenWithoutModel({super.key});

  @override
  State<ScreenWithoutModel> createState() => _ScreenWithoutModelState();
}

class _ScreenWithoutModelState extends State<ScreenWithoutModel> {
  dynamic data;
  bool isReady = false;

  _getSinglePost(){
    isReady = true;
    ApiServices().getSinglePostWithoutModel().then((value){
      data = value!;
      isReady=false;
      setState(() {

      });


    });
  }
  @override
  void initState() {
    _getSinglePost();
    setState(() {
      
    });
    // TODO: implement initState
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: Text("Screen Without Model "),centerTitle: true,),
      body: isReady==true?Center(child: CircularProgressIndicator(),):Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text(data['userId'].toString()),
        SizedBox(height: 20,),
        Text(data['title'].toString()),
        SizedBox(height: 20,),
        Text(data['body'].toString()),
      ],)
     

    );
  }
}
