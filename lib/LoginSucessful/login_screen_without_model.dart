import 'package:api_calling_2025/LoginSucessful/home_screen.dart';
import 'package:api_calling_2025/PostAPI/api_serivices.dart';
import 'package:flutter/material.dart';
class LoginScreenWithoutModel extends StatefulWidget {
  const LoginScreenWithoutModel({super.key});

  @override
  State<LoginScreenWithoutModel> createState() => _LoginScreenWithoutModelState();
}

class _LoginScreenWithoutModelState extends State<LoginScreenWithoutModel> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  dynamic model;
  bool isReady =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen Without Model"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: email,
              decoration: InputDecoration(
                  label: Text("Email"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              controller: password,
              decoration: InputDecoration(
                  label: Text("Password"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          GestureDetector(
            onTap: () {
              isReady = true;
              ApiServices()
                  .getLoginWithoutModel(
                  email.text.toString(), password.text.toString())
                  .then((value) {
                setState(() {
                  model = value!;
                  isReady =false;
                  Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen(
                      token: model['token'].toString()

                  ),));
                });
              });
            },
            child: Container(
              height: 60,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(10)),
              child: isReady ==true ? Center(child: CircularProgressIndicator(),): Center(
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
