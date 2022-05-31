import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:greenma_info_school/screens/mock_test_second.dart';

class mock_test extends StatefulWidget {
  const mock_test({Key key}) : super(key: key);

  @override
  _mock_testState createState() => _mock_testState();
}

class _mock_testState extends State<mock_test> {
   String firstHalf;
   String secondHalf;

  bool flag = true;
  final String text =
      "Flutter is Google’s mobile UI framework for crafting high-quality native interfaces on iOS and Android in record time. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.";

  @override
  void initState() {
    super.initState();

    if (text.length > 50) {
      firstHalf = text.substring(0, 50);
      secondHalf = text.substring(50, text.length);
    } else {
      firstHalf = text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Mock Text'),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(color: Colors.deepOrange),
          ),
        ),
        body: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Card(
                      elevation: 04,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        // if you need this
                        side: BorderSide(
                          color: Colors.deepOrangeAccent,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Column(
                                children: [
                                  Column(children: [
                                    Container(
                                        width: MediaQuery.of(context).size.width *
                                            0.80,
                                        child: Text(
                                          'Daily practise paper for JEE main and advanced shedule',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        )),
                                  ]),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    width: MediaQuery.of(context).size.width * 0.80,
                                    child: Text(
                                      '16 Test - started at 5.30 pm',
                                      style: TextStyle(
                                          color: Colors.deepOrangeAccent,
                                          fontSize: 12),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.80,
                                    margin: EdgeInsets.only(top: 5),
                                    child: secondHalf.isEmpty
                                        ? Text(firstHalf)
                                        : Column(
                                      children: <Widget>[
                                        Text(flag
                                            ? (firstHalf + "...")
                                            : (firstHalf + secondHalf)),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            width: 100,
                                            height: 25,
                                            child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    colors: [
                                                      Colors.deepOrange,
                                                      Colors.orangeAccent
                                                    ]),
                                                borderRadius:
                                                BorderRadius.circular(15),
                                              ),
                                              child: ElevatedButton(
                                                style:
                                                ElevatedButton.styleFrom(
                                                  primary: Colors.transparent,
                                                  shape:
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          30)),
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    flag = !flag;
                                                  });
                                                },
                                                child: Row(
                                                  children: <Widget>[
                                                    Text(
                                                      flag
                                                          ? "Read more"
                                                          : "Read less",
                                                      style: TextStyle(
                                                          color:
                                                          Colors.white),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ))
                        ],
                      )),
                ),
                Card(
                    elevation: 04,
                    color: Colors.deepOrangeAccent,
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.90,
                        height: MediaQuery.of(context).size.height * 0.07,
                        child: Center(
                          child: Text(
                            'Test schedule',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 15),
                          ),
                        ))),
                Container(
                  width: MediaQuery.of(context).size.width * 3,
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: ListView.builder(
                      padding: const EdgeInsets.all(5),
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => register_screen()),
                            );
                          },
                          child: Container(
                              margin:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              child: Row(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.15,
                                    child: Card(
                                        elevation: 5,
                                        shape: CircleBorder(),
                                        child: Container(
                                          width: 45,
                                          height: 45,
                                          child: Center(child: Text('Sep 6',style: TextStyle(color: Colors.deepOrange,fontSize: 12),)),
                                        ) ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.75,
                                    child: Card(
                                        elevation: 04,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                              bottomRight: Radius.circular(20)),
                                          // if you need this
                                          side: BorderSide(
                                            color: Colors.deepOrangeAccent,
                                            width: 1,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 15, horizontal: 10),
                                                child: Column(
                                                  children: [
                                                    Row(children: [
                                                      Column(children: [
                                                        Container(
                                                          child: Text(
                                                            'Topic : Chemistry',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                FontWeight.bold,
                                                                color: Colors.black),
                                                          ),
                                                        ),
                                                      ]),
                                                    ]),
                                                  ],
                                                ))
                                          ],
                                        )),
                                  ),
                                ],
                              )),
                        );
                      }),
                ),
              ],
            )));
  }
}
