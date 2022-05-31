import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:greenma_info_school/config/colors.dart';
import 'package:greenma_info_school/config/strings.dart';
import 'package:greenma_info_school/config/validator.dart';
import 'package:greenma_info_school/model/login/login_model.dart';
import 'package:greenma_info_school/screens/front_screen/otp.dart';
import 'package:greenma_info_school/screens/phone_verification.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController mobileController = TextEditingController();

  validator() {
    if (CommonValidator.mobileNumValidationWithEmpty(mobileController.text) !=
        null) {
      final snackBar = SnackBar(
          content: Text(CommonValidator.mobileNumValidationWithEmpty(
              mobileController.text)));
      _scaffoldKey.currentState.showSnackBar(snackBar);
      return;
    } else {
      postSignUp();
    }
  }

 postSignUp() async {
    Map data;
    final response = await http.post(
      Uri.parse(StringHelper.BASEURL + "/otp-generate"),
      body: {
        'mobile': mobileController.text,
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
      data = jsonDecode(response.body);
      if (data["status"]== 200) {
        List message = data["message"];
        final snackBar = SnackBar(content: Text(message[0]));
        _scaffoldKey.currentState.showSnackBar(snackBar);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => OtpScreen(mobileNumber: mobileController.text,otp: data["otp"].toString())),
              (Route<dynamic> route) => false,
        );
      } else {
        List message = data["errors"];
        final snackBar = SnackBar(content: Text(message[0]));
        _scaffoldKey.currentState.showSnackBar(snackBar);
      }
    } else {
      print('API_Failure');
      throw Exception('Failed to login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Stack(fit: StackFit.expand, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipOval(
                child: new Image.asset('assets/image/logo.jpg',
                    fit: BoxFit.cover, height: 150, width: 150),
              ),
              SizedBox(height: 30),
              Container(
                  child: Text('Welcome!',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 24,
                          fontWeight: FontWeight.bold))),
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: <Widget>[
                    Card(
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 17, horizontal: 15),
                            child: Row(
                              children: [
                                Text('+91'),
                                Icon(Icons.arrow_drop_down)
                              ],
                            ))),
                    Expanded(
                      child: Card(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 05, horizontal: 10),
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            controller: mobileController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Phone Number",
                            ),
                            onChanged: (value) {
                              // this.phoneNo=value;
                              print(value);
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: primary,
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        textStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      validator();
                    },
                    child: Text('Sign In')),
              ),
            ],
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 25),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: RichText(
                      text: TextSpan(
                        children: const <TextSpan>[
                          TextSpan(
                              text: 'Don\'t have an account?',
                              style: TextStyle(color: Colors.black)),
                          TextSpan(
                              text: ' Sign Up',
                              style: TextStyle(color: primary)),
                        ],
                      ),
                    ),
                  )))
        ]));
  }
}
