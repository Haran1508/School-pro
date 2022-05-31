import 'dart:convert';
import 'dart:math';
import 'package:greenma_info_school/config/strings.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:greenma_info_school/config/colors.dart';
import 'package:greenma_info_school/config/validator.dart';

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  void postSignUp() async {
    //https://kirubha.tk/api/register
    //name,email,mobile
    Map data;
    final response = await http.post(
      Uri.parse(StringHelper.BASEURL + "/register"),
      body: {
        'name': userNameController.text,
        'email': emailController.text,
        'mobile': mobileController.text,
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
      data = jsonDecode(response.body);
      if (data['status'] == 200) {
        List message = data["message"];
        final snackBar = SnackBar(content: Text(message[0]));
        _scaffoldKey.currentState.showSnackBar(snackBar);
        Navigator.pushNamed(context, '/login');
      } else {
        List message = data["errors"];
        final snackBar = SnackBar(content: Text(message[0]));
        _scaffoldKey.currentState.showSnackBar(snackBar);
      }
    } else {
      print('API_Failure');
      throw Exception('Failed to Register');
    }
  }

  validation() {
    if (CommonValidator.emptyValidation(userNameController.text) != null) {
      final snackBar = SnackBar(content: Text("Please Enter UserName"));
      _scaffoldKey.currentState.showSnackBar(snackBar);
      return;
    } else if (CommonValidator.emailValidation(emailController.text) != null) {
      final snackBar = SnackBar(
          content: Text(CommonValidator.emailValidation(emailController.text)));
      _scaffoldKey.currentState.showSnackBar(snackBar);
      return;
    } else if (CommonValidator.mobileNumValidationWithEmpty(
            mobileController.text) !=
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey,
          resizeToAvoidBottomInset: false,
          body: Container(
              height: MediaQuery.of(context).size.height * 0.75,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.topRight,
                          child: Text('Sign Up',
                              style: TextStyle(fontSize: 16, color: primary))),
                      Spacer(),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Text('Welcome Student...!',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold))),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text('Let\'s get started')),
                      SizedBox(height: 20),
                      TextField(
                        controller: userNameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Username',
                        ),
                      ),
                      SizedBox(height: 15),
                      TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                      ),
                      SizedBox(height: 15),
                      TextField(
                        controller: mobileController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Mobile Number',
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 15),
                        alignment: Alignment.topRight,
                        child: FloatingActionButton(
                          onPressed: () {
                            // Navigator.pushNamed(context, '/phone');
                            validation();
                          },
                          child: const Icon(Icons.keyboard_arrow_right_sharp),
                          backgroundColor: primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ))),
    );
  }
}
