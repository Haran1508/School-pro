import 'package:flutter/material.dart';
import 'package:greenma_info_school/config/colors.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';


class StartTest extends StatefulWidget {
  const StartTest({Key key}) : super(key: key);

  @override
  _StartTestState createState() => _StartTestState();
}

class _StartTestState extends State<StartTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Start Test"),
        centerTitle: true,
        backgroundColor: new Color(0xffFF5C00),
      ),
      body:Container(
        margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color:Colors.orangeAccent,
                child:Container(
                  padding: EdgeInsets.symmetric(vertical: 25,horizontal: 10),
                  child: Row(
                    children: [
                      Icon(Icons.refresh),
                      Text('50 s'),
                      SizedBox(width:10),
                      new LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width*0.60,
                        lineHeight: 14.0,
                        percent: 0.5,
                        backgroundColor: Colors.white,
                        progressColor: primary,
                      ),
                    ],
                  ),
                ),

              ),
              SizedBox(height:15),
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.black,
                  child:Container(
                    padding:EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Container(
                            width:MediaQuery.of(context).size.width,
                            child: Text('Q1 of 30',style:TextStyle(color: Colors.white,fontSize: 16))),
                        SizedBox(height:15),
                        Text('How many 4 letter word can be formed from the letter of the word \'ANSWER\'.',style:TextStyle(color: Colors.white,fontSize: 14))
                      ],
                    ),
                  )
              ),
              SizedBox(height:10),
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child:Icon(Icons.circle,color: Colors.black87,size:25)
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child:Container(
                      width:MediaQuery.of(context).size.width*0.75,
                      color: Colors.black,
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Text('A',style:TextStyle(color: Colors.white)),
                          SizedBox(width: 20),
                          Text('6C4',style:TextStyle(color: Colors.white))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height:10),
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child:Icon(Icons.circle,color: Colors.black87,size:25)
                  ),
                  Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child:Container(
                        width:MediaQuery.of(context).size.width*0.75,
                        color: Colors.black,
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Text('B',style:TextStyle(color: Colors.white)),
                            SizedBox(width: 20),
                            Text('6C4/2',style:TextStyle(color: Colors.white))
                          ],
                        ),
                      )
                  )

                ],
              ),
              SizedBox(height:10),
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child:Icon(Icons.circle,color: Colors.black87,size:25)
                  ),
                  Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child:Container(
                        width:MediaQuery.of(context).size.width*0.75,
                        color: Colors.black,
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Text('C',style:TextStyle(color: Colors.white)),
                            SizedBox(width: 20),
                            Text('6C4!',style:TextStyle(color: Colors.white))
                          ],
                        ),
                      )
                  )

                ],
              ),
              SizedBox(height:10),
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child:Icon(Icons.circle,color: Colors.black87,size:25)
                  ),
                  Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child:Container(
                        width:MediaQuery.of(context).size.width*0.75,
                        color: Colors.black,
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Text('D',style:TextStyle(color: Colors.white)),
                            SizedBox(width: 20),
                            Text('None of these',style:TextStyle(color: Colors.white))
                          ],
                        ),
                      )
                  )

                ],
              ),
              SizedBox(height:20),
              Align(
                  alignment: Alignment.bottomCenter,
                  child:Container(
                    width: MediaQuery.of(context).size.width*90,
                    child: ElevatedButton(
                        onPressed: (){
                          Navigator.pushNamed(context, '/report');
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(primary),
                        ),
                        child:Text('Submit Answer')
                    ),
                  )
              )
            ],
          ),
        ),
      )
    );
  }
}
