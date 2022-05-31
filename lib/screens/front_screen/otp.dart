import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greenma_info_school/config/colors.dart';
import 'package:greenma_info_school/config/strings.dart';
import 'package:greenma_info_school/model/login/login_model.dart';
import 'package:greenma_info_school/utils/sharedpreference_helper.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:http/http.dart' as http;

class OtpScreen extends StatefulWidget {
  final String mobileNumber;
  final String otp;

  OtpScreen({Key key, this.mobileNumber, this.otp}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String otpValue;
  LoginModel loginModel;

  @override
  void initState() {
    super.initState();
    Fluttertoast.showToast(
        msg: widget.otp,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.orange,
        textColor: Colors.white,
        fontSize: 14.0);
  }

  postLoginValue() async {
    Map data;
    final response = await http.post(
      Uri.parse(StringHelper.BASEURL + "/otp-verify"),
      body: {
        'mobile': widget.mobileNumber,
        'otp': otpValue,
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      if (data["status"] == 200) {
        loginModel = LoginModel.fromJson(data);
        SharePreferencesHelper.getInstant()
            .setBool(SharePreferencesHelper.Is_Login, true);
        SharePreferencesHelper.getInstant().setString(
            SharePreferencesHelper.Id, loginModel.usr.id.toString() ?? null);
        SharePreferencesHelper.getInstant().setAccessToken(
            SharePreferencesHelper.Access_Token, loginModel.usrToken ?? null);
        SharePreferencesHelper.getInstant().setName(
            SharePreferencesHelper.Full_Name, loginModel.usr.name ?? null);
        SharePreferencesHelper.getInstant().setEmail(
            SharePreferencesHelper.Email, loginModel.usr.email ?? null);
        SharePreferencesHelper.getInstant().setMobile(
            SharePreferencesHelper.Phone, loginModel.usr.mobile ?? null);
        SharePreferencesHelper.getInstant().setAddress(
            SharePreferencesHelper.Address, loginModel.usr.address ?? null);
        openAlertBox();
      } else {
        List message = data["errors"];
        final snackBar = SnackBar(content: Text(message[0]));
        _scaffoldKey.currentState.showSnackBar(snackBar);
      }
    } else {
      throw Exception('Failed to create album.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey,
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
                          margin: EdgeInsets.symmetric(vertical: 15),
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(Icons.arrow_back)),
                              SizedBox(width: 55),
                              Text('Verified',
                                  style:
                                      TextStyle(fontSize: 16, color: primary)),
                            ],
                          )),
                      SizedBox(height: 20),
                      Text('OTP - ${widget.otp}',
                          style: TextStyle(fontSize: 16, color: primary)),
                      SizedBox(height: 20),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Text('Verified your number',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold))),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: '6 digit code send to',
                                  style: TextStyle(color: Colors.black)),
                              TextSpan(
                                  text: widget.mobileNumber,
                                  style: TextStyle(color: Colors.blue)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      OTPTextField(
                        length: 6,
                        width: MediaQuery.of(context).size.width * 30,
                        fieldWidth: 40,
                        style: TextStyle(fontSize: 15),
                        fieldStyle: FieldStyle.box,
                        outlineBorderRadius: 10,
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        onCompleted: (pin) {
                          setState(() {
                            otpValue = pin;
                          });
                          print("Completed: " + pin);
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Text('Resend')),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 25),
                            child: FloatingActionButton(
                              onPressed: () {
                                if (otpValue != null && otpValue != "")
                                  postLoginValue();
                                else {
                                  final snackBar = SnackBar(
                                      content: Text("Please Enter OTP"));
                                  _scaffoldKey.currentState
                                      .showSnackBar(snackBar);
                                }
                              },
                              child: const Icon(Icons.check),
                              backgroundColor: primary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ))),
    );
  }

  openAlertBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child:
                          Icon(Icons.check_circle, size: 40, color: primary)),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Text(
                      "Congratulations!",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22.0),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('Your mobile number verified successful!',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12)),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 02, horizontal: 10),
                    child: Text('you can continue using koolls online shopping',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12)),
                  ),
                  SizedBox(height: 25),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(32.0),
                            bottomRight: Radius.circular(32.0)),
                      ),
                      child: Text(
                        "Go to Next!",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
