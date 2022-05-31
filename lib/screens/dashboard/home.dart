import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:greenma_info_school/api_manager/get_api.dart';
import 'package:greenma_info_school/model/dashboard/dashbord_model.dart';
import 'package:greenma_info_school/screens/free_class.dart';
import 'package:greenma_info_school/screens/live_class.dart';
import 'package:greenma_info_school/screens/online_test.dart';
import 'package:greenma_info_school/screens/profile.dart';
import 'package:greenma_info_school/screens/upcomming_class.dart';
import 'package:greenma_info_school/utils/sharedpreference_helper.dart';
import 'package:greenma_info_school/widgets/bottom_bar.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:stories_for_flutter/stories_for_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final _inactiveColor = Colors.grey;

  final String assetName = 'assets/svg/edit.svg';

  String userId, courseId;
  bool integrationTime = false, responseTime = false;
  String token;
  String name;
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
    name = await SharePreferencesHelper.getInstant()
        .getAccessToken(SharePreferencesHelper.Full_Name);
  }

  getData() {
    setState(() {
      _list = ApiManager().getDashBoard(token);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:
          new Color(0xffFF5C00), //or set color with: Color(0xFF0000FF)
    ));

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Home"),
          centerTitle: true,
          backgroundColor: new Color(0xffFF5C00),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
        ),
        body: ModalProgressHUD(
          inAsyncCall: integrationTime,
          progressIndicator: CircularProgressIndicator(
            color: Colors.orange,
            strokeWidth: 2,
          ),
          child: getBody(),
        ),
        drawer: SafeArea(
          child: Drawer(
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  child: Center(
                      child: Column(
                    children: [
                      Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image:
                                      AssetImage("assets/image/banner.jpeg")))),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        name,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.normal),
                      )
                    ],
                  )),
                ),
                ListTile(
                  leading: Icon(
                    Icons.videocam,
                    color: Color(0xffFF5C00),
                  ),
                  title: const Text(
                    'Online Free Classes',
                    style: TextStyle(
                        color: Color(0xffFF5C00),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/free_class');
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.question_answer,
                    color: Color(0xffFF5C00),
                  ),
                  title: const Text(
                    'Question Bank',
                    style: TextStyle(
                        color: Color(0xffFF5C00),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/bank');
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.online_prediction,
                    color: Color(0xffFF5C00),
                  ),
                  title: const Text(
                    'Online Test',
                    style: TextStyle(
                        color: Color(0xffFF5C00),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/online_test');
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.people,
                    color: Color(0xffFF5C00),
                  ),
                  title: const Text(
                    'Teachers',
                    style: TextStyle(
                        color: Color(0xffFF5C00),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.popAndPushNamed(context, '/teacher_list');
                    //Navigator.popAndPushNamed(context, '/teacher_profile');
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Color(0xffFF5C00),
                  ),
                  title: const Text(
                    'Logout',
                    style: TextStyle(
                        color: Color(0xffFF5C00),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.popAndPushNamed(context, '/login');
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomBar());
  }

  Widget _buildBottomBar() {
    return CustomAnimatedBottomBar(
      containerHeight: 70,
      backgroundColor: new Color(0xffFF5C00),
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: (index) => setState(() => _currentIndex = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.white,
          ),
          title: Text('Home'),
          activeColor: Colors.white,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(
            Icons.videocam,
            color: Colors.white,
          ),
          title: Text('Live Class'),
          activeColor: Colors.white,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(
            Icons.video_library,
            color: Colors.white,
          ),
          title: Text(
            'Free Class',
          ),
          activeColor: Colors.white,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(
            Icons.book_online,
            color: Colors.white,
          ),
          title: Text('Online Test'),
          activeColor: Colors.white,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(
            Icons.person,
            color: Colors.white,
          ),
          title: Text('Profile'),
          activeColor: Colors.white,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: Container(
                  padding:
                      EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "NEET UG",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        name,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                ),
                elevation: 5,
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stories(
                      circlePadding: 6,
                      storyItemList: [
                        StoryItem(
                            name: "First Story",
                            thumbnail: const NetworkImage(
                              "https://www.pngall.com/wp-content/uploads/4/Female-Teacher-PNG-Free-Download.png",
                            ),
                            stories: [
                              Scaffold(
                                body: Container(
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        "https://wallpaperaccess.com/full/16568.png",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Scaffold(
                                body: Container(
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        "https://i.pinimg.com/originals/2e/c6/b5/2ec6b5e14fe0cba0cb0aa5d2caeeccc6.jpg",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                        StoryItem(
                            name: "2nd",
                            thumbnail: const NetworkImage(
                              "https://www.pngall.com/wp-content/uploads/4/Teacher-PNG.png",
                            ),
                            stories: [
                              Scaffold(
                                body: Container(
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        "https://wallpaperaccess.com/full/16568.png",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Scaffold(
                                body: Container(
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        "https://i.pinimg.com/originals/2e/c6/b5/2ec6b5e14fe0cba0cb0aa5d2caeeccc6.jpg",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                        StoryItem(
                            name: "3rd",
                            thumbnail: const NetworkImage(
                              "https://www.nicepng.com/png/detail/4-46142_open-book-free-vector-png-pic-open-book.png",
                            ),
                            stories: [
                              Scaffold(
                                body: Container(
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        "https://wallpaperaccess.com/full/16568.png",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Scaffold(
                                body: Container(
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        "https://i.pinimg.com/originals/2e/c6/b5/2ec6b5e14fe0cba0cb0aa5d2caeeccc6.jpg",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                        StoryItem(
                            name: "4th",
                            thumbnail: const NetworkImage(
                              "https://pngimg.com/uploads/book/book_PNG2105.png",
                            ),
                            stories: [
                              Scaffold(
                                body: Container(
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        "https://wallpaperaccess.com/full/16568.png",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Scaffold(
                                body: Container(
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        "https://i.pinimg.com/originals/2e/c6/b5/2ec6b5e14fe0cba0cb0aa5d2caeeccc6.jpg",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                        StoryItem(
                            name: "5th",
                            thumbnail: const NetworkImage(
                              "https://www.pngall.com/wp-content/uploads/4/Cartoon-Teacher-PNG-Clipart.png",
                            ),
                            stories: [
                              Scaffold(
                                body: Container(
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        "https://wallpaperaccess.com/full/16568.png",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Scaffold(
                                body: Container(
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        "https://i.pinimg.com/originals/2e/c6/b5/2ec6b5e14fe0cba0cb0aa5d2caeeccc6.jpg",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                        StoryItem(
                          name: "6th",
                          thumbnail: const NetworkImage(
                            "https://www.shareicon.net/data/512x512/2017/03/29/881758_cup_512x512.png",
                          ),
                          stories: [
                            Scaffold(
                              body: Container(
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      "https://i.pinimg.com/originals/31/bc/a9/31bca95ba39157a6cbf53cdf09dda672.png",
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Scaffold(
                              backgroundColor: Colors.black,
                              body: Center(
                                child: Text(
                                  "That's it, Folks !",
                                  style: TextStyle(
                                    color: Color(0xffffffff),
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 10, bottom: 2, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Watch free classes",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/free_class');
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
                  SizedBox(
                    height: 250,
                    child: FutureBuilder<DashBoardModel>(
                        future: _list,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            var obj = snapshot.data;
                            return obj.freeClasses.length == 0
                                ? Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 300),
                                      child: Container(
                                        child: Text('No Data'),
                                      ),
                                    ),
                                  )
                                : ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: obj.freeClasses.length,
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, '/vedio_class');
                                        },
                                        child: CourseCard(
                                          obj.freeClasses[index].subject.name,
                                          obj.freeClasses[index].description,
                                          obj.freeClasses[index].duration,
                                          obj.freeClasses[index].teacher.name,
                                          obj.freeClasses[index].course.name,
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
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "You could also",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: SizedBox(
                      height: 5,
                      child: Container(
                        color: Colors.grey.shade100,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: [
                              Icon(
                                Icons.chat_bubble,
                                color: Colors.green,
                                size: 35,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Ask a doubt",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/livechat');
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
                        ]),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: [
                              Icon(
                                Icons.chat_bubble,
                                color: Colors.blue,
                                size: 35,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Take a quick quiz",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/quiz');
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
                        ]),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: [
                              Icon(
                                Icons.chat_bubble,
                                color: Colors.redAccent,
                                size: 35,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Try a mock test",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/mocktest');
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
                        ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 70,
                    padding: EdgeInsets.only(
                        left: 10, bottom: 10, top: 10, right: 10),
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey.shade200,
                    child: ElevatedButton(
                        child: Text("Get Subcription",
                            style: TextStyle(fontSize: 14)),
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xffFF5C00)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(18.0)))),
                        onPressed: () => Navigator.pushNamed(context, '/subs')),
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
                          "Meet our Teacher",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/teacher_list');
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
                  SizedBox(
                      height: 180,
                      child: FutureBuilder<DashBoardModel>(
                          future: _list,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var obj = snapshot.data;
                              return obj.teachers.length == 0
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
                                      itemCount: obj.teachers.length,
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, '/vedio_class');
                                          },
                                          child: EducatorCard(
                                              "assets/image/teacher.png"),
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
                          })),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Courses on All subjects",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
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
                                      UpcomingClass('Upcoming Class', '1')),
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
                  SizedBox(
                      height: 250,
                      child: FutureBuilder<DashBoardModel>(
                          future: _list,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var obj = snapshot.data;
                              return obj.upcomingClasses.length == 0
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
                                      itemCount: obj.upcomingClasses.length,
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, '/vedio_class');
                                          },
                                          child: UpcomingCard(
                                            obj.upcomingClasses[index].subject
                                                .name,
                                            obj.upcomingClasses[index]
                                                .description,
                                            obj.upcomingClasses[index].duration,
                                            obj.upcomingClasses[index].teacher
                                                .name,
                                            obj.upcomingClasses[index].course
                                                .name,
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
                                      UpcomingClass('Recently Started', '2')),
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
                  SizedBox(
                      height: 250,
                      child: FutureBuilder<DashBoardModel>(
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
                              return Center(
                                  child: CircularProgressIndicator(
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
                                      UpcomingClass('Completed Class', '3')),
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
                  SizedBox(
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
                                    itemCount:
                                        obj.recentlyCompletedClasses.length,
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, '/vedio_class');
                                        },
                                        child: CompleteCard(
                                          obj.recentlyCompletedClasses[index]
                                              .subject.name,
                                          obj.recentlyCompletedClasses[index]
                                              .description,
                                          obj.recentlyCompletedClasses[index]
                                              .duration,
                                          obj.recentlyCompletedClasses[index]
                                              .teacher.name,
                                          obj.recentlyCompletedClasses[index]
                                              .course.name,
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
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 10, bottom: 2, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Question Bank",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/bank');
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
                  SizedBox(
                      height: 180,
                      child: FutureBuilder<DashBoardModel>(
                          future: _list,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var obj = snapshot.data;
                              print('obj.questionBank.length');
                              print(obj.questionBank.length);
                              return obj.questionBank.length == 0
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
                                      itemCount: obj.questionBank.length,
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, '/bank');
                                          },
                                          child: BookCard(""),
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
                          "Online Test",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/online_test');
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
                  SizedBox(
                      height: 180,
                      child: FutureBuilder<DashBoardModel>(
                          future: _list,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var obj = snapshot.data;
                              return obj.onlineTest.length == 0
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
                                      itemCount: obj.onlineTest.length,
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, '/online_test');
                                          },
                                          child: BookCard(
                                              obj.onlineTest[index].image !=
                                                      null
                                                  ? obj.onlineTest[index].image
                                                  : ""),
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
                          })),
                  SizedBox(
                    height: 10,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      LiveClass(),
      Free_Class(),
      OnlineTestScreen(),
      Profile(),
      Container(
        alignment: Alignment.center,
        child: Text(
          "Profile",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    ];
    return IndexedStack(
      index: _currentIndex,
      children: pages,
    );
  }
}

class EducatorCard extends StatelessWidget {
  final String imagePath;

  EducatorCard(
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
              height: 150.0,
              width: 150.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imagePath), fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final String imagePath;

  BookCard(
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
              height: 150.0,
              width: 150.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/image/banner5.jpg"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String subject;
  final String description;
  final String duration;
  final String teacherName;
  final String courseName;

  CourseCard(this.subject, this.description, this.duration, this.teacherName,
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
              width: 345.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/image/banner.jpeg"),
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

class UpcomingCard extends StatelessWidget {
  final String subject;
  final String description;
  final String duration;
  final String teacherName;
  final String courseName;

  UpcomingCard(this.subject, this.description, this.duration, this.teacherName,
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
                      image: AssetImage('assets/image/banner2.jpg'),
                      fit: BoxFit.cover),
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
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
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
