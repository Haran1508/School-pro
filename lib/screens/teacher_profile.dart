import 'package:flutter/material.dart';
import 'package:greenma_info_school/screens/upcomming_class.dart';

class TeachersProfile extends StatefulWidget {
  const TeachersProfile({Key key}) : super(key: key);

  @override
  _TeachersProfileState createState() => _TeachersProfileState();
}

class _TeachersProfileState extends State<TeachersProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Teachers Profile"),
          centerTitle: true,
          backgroundColor: new Color(0xffFF5C00),

        ),
        body:SingleChildScrollView(
            child:Column(
              children: [
                SizedBox(height:10),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Card(
                        elevation: 04,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child:Row(
                          children: [
                            Container(height:MediaQuery.of(context).size.height*0.18, width:20, decoration: BoxDecoration(
                                color: Colors.deepOrangeAccent,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10))
                            )),
                            Container(
                                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 15),
                                child: Row(
                                    children: [
                                      Column(children: [
                                        Container(
                                            width:MediaQuery.of(context).size.width*0.55,
                                            child: Text('Manys Roy',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  color: Colors.deepOrangeAccent
                                              ),)),
                                        Container(
                                            margin:EdgeInsets.only(top:5),
                                            width:MediaQuery.of(context).size.width*0.55,
                                            child: Text('Mphil.,phD.,',
                                              style: TextStyle(color: Colors.black38,
                                                  fontSize:12,fontWeight: FontWeight.bold),)),
                                        Container(
                                            margin:EdgeInsets.only(top:2),
                                            width:MediaQuery.of(context).size.width*0.55,
                                            child: Text('Physics',
                                              style: TextStyle(color: Colors.black38,
                                                  fontSize:12,fontWeight: FontWeight.bold),)),
                                        Container(
                                            margin:EdgeInsets.only(top:2),
                                            width:MediaQuery.of(context).size.width*0.55,
                                            child: Text('10 Years Experience',
                                              style: TextStyle(color: Colors.black38,fontSize:12,fontWeight: FontWeight.bold),)),
                                      ]),
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.20,
                                        child: ClipOval(
                                          child: Image.asset(
                                            'assets/image/teacher.png',
                                            fit: BoxFit.cover,
                                            height: 75,
                                            width: 44,
                                          ),
                                        ),
                                      ),
                                    ]))
                          ],
                        )
                    )),
                SizedBox(height:15),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 0, left: 10, bottom: 2, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Special Classes",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                     GestureDetector(
                       onTap: (){
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => UpcomingClass('Special Class','1')),
                         );
                       },
                        child: Text(
                          "View All",
                          style: TextStyle(
                              color: new Color(0xffFF5C00),
                              fontSize: 14,
                              letterSpacing: 1.9,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return RecentlyCard(
                          "Figma Design", "24", "assets/image/banner3.jpg");
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 0, left: 10, bottom: 2, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Ongoing Classes",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => UpcomingClass('Ongoing Class','2')),
                          );
                        },
                        child: Text(
                          "View All",
                          style: TextStyle(
                              color: new Color(0xffFF5C00),
                              fontSize: 14,
                              letterSpacing: 1.9,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return CompleteCard(
                          "Figma Design", "24", "assets/image/banner4.jpg");
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 0, left: 10, bottom: 2, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Completed Classes",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => UpcomingClass('Completed Class','3')),
                          );
                        },
                        child: Text(
                          "View All",
                          style: TextStyle(
                              color: new Color(0xffFF5C00),
                              fontSize: 14,
                              letterSpacing: 1.9,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return CompleteCard(
                          "Figma Design", "24", "assets/image/banner4.jpg");
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            )
        )
    );
  }
}


class RecentlyCard extends StatelessWidget {
  final String title, count, imagePath;

  RecentlyCard(
      this.title,
      this.count,
      this.imagePath,
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, top: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 140.0,
              width: 300.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imagePath), fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0, top: 5),
              child: Text(
                'PHYSICS',
                style: TextStyle(
                    color: Colors.grey[400],
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0, top: 5),
              child: Text(
                'Super Stategy Session on Spherical Lenses',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 14.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0, top: 5),
              child: Text(
                '48 min , By Shankar Roy',
                style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.normal,
                    fontSize: 12.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6, top: 5),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: new Color(0xffFF5C00),
                    size: 10,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Master Class',
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.normal,
                        fontSize: 12.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CompleteCard extends StatelessWidget {
  final String title, count, imagePath;

  CompleteCard(
      this.title,
      this.count,
      this.imagePath,
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, top: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 140.0,
              width: 300.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imagePath), fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0, top: 5),
              child: Text(
                'PHYSICS',
                style: TextStyle(
                    color: Colors.grey[400],
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0, top: 5),
              child: Text(
                'Super Stategy Session on Spherical Lenses',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 14.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0, top: 5),
              child: Text(
                '48 min , By Shankar Roy',
                style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.normal,
                    fontSize: 12.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6, top: 5),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: new Color(0xffFF5C00),
                    size: 10,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Master Class',
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.normal,
                        fontSize: 12.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}