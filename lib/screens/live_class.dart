import 'package:flutter/material.dart';
import 'package:greenma_info_school/api_manager/get_api.dart';
import 'package:greenma_info_school/model/dashboard/dashbord_model.dart';
import 'package:greenma_info_school/screens/upcomming_class.dart';
import 'package:greenma_info_school/utils/sharedpreference_helper.dart';
import 'package:video_player/video_player.dart';

class LiveClass extends StatefulWidget {
  const LiveClass({Key key}) : super(key: key);

  @override
  _LiveClassState createState() => _LiveClassState();
}

class _LiveClassState extends State<LiveClass> {
  String token;
  Future<DashBoardModel> _list;

  @override
  void initState() {
    super.initState();
    fun();
  }

  Future<void> fun() async {
    await getStore();
    await getData();
  }

  getStore() async {
    print('sharedPrefData');
    token = await SharePreferencesHelper.getInstant()
        .getAccessToken(SharePreferencesHelper.Access_Token);
  }

  getData() {
    setState(() {
      _list = ApiManager().getDashBoard(token);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use a FutureBuilder to display a loading spinner while waiting for the
      // VideoPlayerController to finish initializing.
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                    "Upcomming",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                UpcomingClass('Upcoming Class','1')),
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
                child: FutureBuilder<DashBoardModel>(
                    future: _list,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var obj = snapshot.data;
                        return obj.upcomingClasses.length == 0
                            ? Align(
                          child:Container(
                            child: Text('No Data',style: TextStyle(color: Colors.black26),),
                          ),
                        )
                            : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: obj.upcomingClasses.length,
                          shrinkWrap: true,
                          itemBuilder:
                              (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/vedio_class');
                              },
                              child: UpcomingCard("Figma Design",
                                  "24", "assets/image/banner2.jpg"),
                            );
                          },
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        return Center(child: Text('No Data'));
                      } else {
                        return Center(child: CircularProgressIndicator(
                          color: Colors.orange,
                          strokeWidth: 2,
                        ));
                      }
                    })),
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
                    "Recently Started",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                UpcomingClass('Recently Started','2')),
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
                child:FutureBuilder<DashBoardModel>(
                    future: _list,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var obj = snapshot.data;
                        return obj.liveClasses.length == 0
                            ? Align(
                          child: Container(
                            child: Text(
                              'No Data',
                              style:
                              TextStyle(color: Colors.black26),
                            ),
                          ),
                        )
                            : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: obj.liveClasses.length,
                          shrinkWrap: true,
                          itemBuilder:
                              (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/vedio_class');
                              },
                              child: RecentlyCard(
                                obj.liveClasses[index].subject.name,
                                obj.liveClasses[index].description,
                                obj.liveClasses[index].duration,
                                obj.liveClasses[index].teacher.name,
                                obj.liveClasses[index].course.name,
                              ),
                            );
                          },
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        return Center(child: Text('No Data'));
                      } else {
                        return Center(child: CircularProgressIndicator(
                          color: Colors.orange,
                          strokeWidth: 2,
                        ));
                      }
                    })),
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
                    "Completed",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                UpcomingClass('Completed Class','3')),
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
              child: FutureBuilder<DashBoardModel>(
                  future: _list,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var obj = snapshot.data;
                      return obj.recentlyCompletedClasses.length == 0
                          ? Align(
                        child: Container(
                          child: Text(
                            'No Data',
                            style: TextStyle(color: Colors.black26),
                          ),
                        ),
                      )
                          : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: obj.recentlyCompletedClasses.length,
                        shrinkWrap: true,
                        itemBuilder:
                            (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/vedio_class');
                            },
                            child: CompleteCard(
                              obj.recentlyCompletedClasses[index].subject.name,
                              obj.recentlyCompletedClasses[index].description,
                              obj.recentlyCompletedClasses[index].duration,
                              obj.recentlyCompletedClasses[index].teacher.name,
                              obj.recentlyCompletedClasses[index].course.name,
                            ),
                          );
                        },
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      return Center(child: Text('No Data'));
                    } else {
                      return Center(
                          child: CircularProgressIndicator(
                            color: Colors.orange,
                            strokeWidth: 2,
                          ));
                    }
                  }),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class UpcomingCard extends StatelessWidget {
  final String title, count, imagePath;

  UpcomingCard(
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

class RecentlyCard extends StatelessWidget {
  final String subject;
  final String description;
  final String duration;
  final String teacherName;
  final String courseName;

  RecentlyCard(this.subject, this.description, this.duration, this.teacherName,
      this.courseName);

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
                      image: AssetImage("assets/image/banner3.jpg"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0, top: 5),
              child: Text(
                subject,
                style: TextStyle(
                    color: Colors.grey[400],
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.85,
              height: 20,
              child: Padding(
                padding: const EdgeInsets.only(left: 4.0, top: 5),
                child: Text(
                  description,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 14.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0, top: 5),
              child: Text(
                duration +' min , By '+teacherName,
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
                    courseName,
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
  final String subject;
  final String description;
  final String duration;
  final String teacherName;
  final String courseName;

  CompleteCard(this.subject, this.description, this.duration, this.teacherName,
      this.courseName);

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
                      image: AssetImage("assets/image/banner4.jpg"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0, top: 5),
              child: Text(
                subject,
                style: TextStyle(
                    color: Colors.grey[400],
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0, top: 5),
              child: Text(
                description,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 14.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0, top: 5),
              child: Text(
                duration + ' min , By ' + teacherName,
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
                    courseName,
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
