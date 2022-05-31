import 'package:flutter/material.dart';
import 'package:greenma_info_school/config/colors.dart';

class register_screen extends StatefulWidget {
  const register_screen({Key key}) : super(key: key);

  @override
  _register_screenState createState() => _register_screenState();
}

class _register_screenState extends State<register_screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body:Container(
              child:Column(
                children: [
                  Container(
                    height:MediaQuery.of(context).size.height*0.50,

                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(bottomRight:Radius.circular(20),bottomLeft: Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            Container(
                              width:MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(vertical:10),

                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Icon(Icons.arrow_back_ios_outlined,size: 20,color: Colors.deepOrange,)),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              width:MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(vertical:10),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  width: 105,
                                  height: 30,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30)),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Resume Test',
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 12),
                                        ),
                                      ],
                                    ),
                                    onPressed: () {},
                                    color: Colors.deepOrangeAccent,
                                    textColor: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                                width:MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(vertical:5),
                                child:Text('Mock Test 1',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold))
                            ),
                            Container(
                                child:Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width*0.10,

                                      child: Icon(Icons.calendar_today_outlined,size: 15,),
                                    ),
                                    Container(
                                        width: MediaQuery.of(context).size.width*0.70,
                                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                                        child: Container(
                                          child: Column(children: [
                                            Container(
                                              child: Text('Held on Sep 17, 2021',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,fontSize: 13
                                                ),),
                                              width: MediaQuery.of(context).size.width,
                                            ),
                                            SizedBox(height: 5,),
                                            Container(
                                              child: Text('No const EMI',
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.black87
                                                ),),
                                              width: MediaQuery.of(context).size.width,
                                            ),
                                          ]),
                                        )),
                                  ],
                                )
                            ),
                            Container(
                                child:Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width*0.10,

                                      child: Icon(Icons.featured_play_list_outlined,size: 15,),
                                    ),
                                    Container(
                                        width: MediaQuery.of(context).size.width*0.70,
                                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                                        child: Container(
                                          child: Column(children: [
                                            Container(
                                              child: Text('10 Questions, 40 marks',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,fontSize: 13
                                                ),),
                                              width: MediaQuery.of(context).size.width,
                                            ),
                                            SizedBox(height: 5,),
                                            Container(
                                              child: Text('No const EMI',
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.black87
                                                ),),
                                              width: MediaQuery.of(context).size.width,
                                            ),
                                          ]),
                                        )),
                                  ],
                                )
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50,),
                  Container(
                    height:MediaQuery.of(context).size.height*0.2,
                    width:MediaQuery.of(context).size.width*0.7,
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child:Container(
                          width: MediaQuery.of(context).size.width*70,
                          child: ElevatedButton(
                              onPressed: (){
                                Navigator.pushNamed(context, '/mock_test');
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(primary),
                              ),
                              child:Text('Start Test')
                          ),
                        )
                    ),
                  )

                ],
              ),

          )
      ),
    );
  }
}
