import 'package:api_calling_2025/LoginSucessful/home_screen.dart';
import 'package:api_calling_2025/PostAPI/api_serivices.dart';
import 'package:api_calling_2025/model/login_success.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  LoginSuccess loginSuccess = LoginSuccess();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
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
              ApiServices()
                  .getLoginWithModel(
                      email.text.toString(), password.text.toString())
                  .then((value) {
                setState(() {
                  loginSuccess = value!;
                  Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen(
                    token: loginSuccess.token.toString()
                  ),));
                });
              });
            },
            child: Container(
              height: 60,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(10)),
              child: Center(
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
