import 'package:flutter/material.dart';
import 'package:greenma_info_school/config/colors.dart';

class PhoneVerification extends StatefulWidget {
  final String mobileNumber;

  const PhoneVerification({Key key, this.mobileNumber}) : super(key: key);

  @override
  _PhoneVerificationState createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
              height: MediaQuery.of(context).size.height * 0.60,
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
                              Text('Phone Number',
                                  style:
                                      TextStyle(fontSize: 16, color: primary)),
                            ],
                          )),
                      SizedBox(height: 50),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          width: MediaQuery.of(context).size.width,
                          child: Text('Enter mobile number to continue')),
                      SizedBox(height: 20),
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
                                elevation: 04,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 05, horizontal: 10),
                                  child: TextField(
                                    keyboardType: TextInputType.phone,
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
                        margin: EdgeInsets.symmetric(vertical: 25),
                        alignment: Alignment.topRight,
                        child: FloatingActionButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/otp');
                            // Add your onPressed code here!
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
