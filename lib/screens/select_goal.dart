import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:greenma_info_school/config/colors.dart';
import 'package:greenma_info_school/config/strings.dart';
import 'package:greenma_info_school/utils/sharedpreference_helper.dart';
import 'package:http/http.dart' as http;

class SelectGoal extends StatefulWidget {
  const SelectGoal({Key key}) : super(key: key);

  @override
  _SelectGoalState createState() => _SelectGoalState();
}

class _SelectGoalState extends State<SelectGoal> {
  Future<http.Response> _responseFutureForList;

  loadData() async {
    _responseFutureForList =
        http.get(Uri.parse(StringHelper.BASEURL + "Course/loadCourse"));
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  postCourse(String courseId) async {
    //id, courseid, subjectid
    //http://localhost:8080/sms_gi/UserProfile/updateCoursedetails

    String userId = await SharePreferencesHelper.getInstant()
        .getString(SharePreferencesHelper.Id);

    Map data;
    print(userId);
    print(courseId);
    final response = await http.post(
      Uri.parse(StringHelper.BASEURL + "UserProfile/updateCoursedetails"),
      body: {
        'id': userId,
        'course_id': courseId,
        'subjectid': "0",
      },
    );

    try {
      print(response.body);
      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
        if (data["success"]) {
          SharePreferencesHelper.getInstant()
              .setString(SharePreferencesHelper.CourseId, courseId ?? null);
          Navigator.pushNamed(context, '/home');
        }
      }
    } catch (e) {
      print("Catch " + e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(backgroundColor: primary, title: Text('Select Your Goal')),
        body: Container(
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            // height: MediaQuery.of(context).size.height * 0.50,
            child: Column(
              children: [
                Card(
                    color: primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Text('Popular Cources',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white)))),
                SizedBox(height: 10),
                Container(
                  child: SingleChildScrollView(
                    child: new FutureBuilder(
                        future: _responseFutureForList,
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> response) {
                          if (!response.hasData) {
                            return const Center(
                              child: const Text('No Records'),
                            );
                          } else {
                            Map<String, dynamic> json =
                                jsonDecode(response.data.body);
                            print(response.data.body);
                            print(json["success"]);
                            if (json["success"]) {
                              print(response.data.body);
                              List<dynamic> data = json["result"];
                              List<Widget> reasonList = [];
                              data.forEach((element) {
                                reasonList.add(GestureDetector(
                                  onTap: () {
                                    // _ackAlert(context,element);
                                  },
                                  child: new Container(
                                      margin:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(Icons.description,
                                              size: 18, color: primary),
                                          Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.50,
                                              child: Text(element['name'],
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16))),
                                          GestureDetector(
                                            onTap: () {
                                              postCourse(element["courseid"]);
                                            },
                                            child: Container(
                                              width: 25,
                                              height: 25,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Color(0xffFF5C00)),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Colors.white,
                                                  size: 10,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      )),
                                ));
                                // }
                              });
                              return new Column(children: reasonList);
                            } else {
                              return const Center(
                                child: const Text('No Records'),
                              );
                            }
                            ;
                          }
                        }),
                  ),
                ),
                /*Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.stars_outlined,
                          size: 18, color: primary),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.50,
                          child: Text('Neet PG',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16))),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xffFF5C00)),
//                            color: Color(0xffFF5C00),
                          child: Align(
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 10,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.pie_chart, size: 18, color: primary),
                        Container(
                            width:
                                MediaQuery.of(context).size.width * 0.50,
                            child: Text('IIT JEE MAIN',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16))),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/home');
                          },
                          child: Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xffFF5C00)),
//                            color: Color(0xffFF5C00),
                            child: Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 10,
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.add_chart, size: 18, color: primary),
                        Container(
                            width:
                                MediaQuery.of(context).size.width * 0.50,
                            child: Text('IIT JEE ADVANCED',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16))),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/home');
                          },
                          child: Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xffFF5C00)),
//                            color: Color(0xffFF5C00),
                            child: Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 10,
                              ),
                            ),
                          ),
                        )
                      ],
                    ))*/
              ],
            )));
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
