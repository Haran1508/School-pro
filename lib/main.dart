import 'dart:async';
import 'package:flutter/material.dart';
import 'package:greenma_info_school/config/colors.dart';
import 'package:greenma_info_school/screens/TeacherList.dart';
import 'package:greenma_info_school/screens/dashboard/home.dart';
import 'package:greenma_info_school/screens/live_chat.dart';
import 'package:greenma_info_school/screens/front_screen/login.dart';
import 'package:greenma_info_school/screens/mock_test.dart';
import 'package:greenma_info_school/screens/live_class.dart';
import 'package:greenma_info_school/screens/online_test.dart';
import 'package:greenma_info_school/screens/online_test_appbar.dart';
import 'package:greenma_info_school/screens/front_screen/otp.dart';
import 'package:greenma_info_school/screens/phone_verification.dart';
import 'package:greenma_info_school/screens/profile.dart';
import 'package:greenma_info_school/screens/question_bank/question_bank.dart';
import 'package:greenma_info_school/screens/quiz/quiz.dart';
import 'package:greenma_info_school/screens/front_screen/register.dart';
import 'package:greenma_info_school/screens/select_goal.dart';
import 'package:greenma_info_school/screens/quiz/start_test.dart';
import 'package:greenma_info_school/screens/plan/subscription.dart';
import 'package:greenma_info_school/screens/teacher_profile.dart';
import 'package:greenma_info_school/screens/test_report.dart';
import 'package:greenma_info_school/screens/upcomming_class.dart';
import 'package:greenma_info_school/screens/vedio_play_screen.dart';
import 'package:greenma_info_school/screens/watch_free_class.dart';
import 'package:greenma_info_school/utils/sharedpreference_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primary,
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => Login(),
        '/signup': (context) => Register(),
        '/phone': (context) => PhoneVerification(),
        '/otp': (context) => OtpScreen(),
        '/goal': (context) => SelectGoal(),
        '/home': (context) => MyHomePage(),
        '/online': (context) => LiveClass(),
        '/test': (context) => OnlineTestScreen(),
        '/online_test': (context) => online_test_appbar(),
        '/quiz': (context) => Quiz(),
        '/bank': (context) => QuestionBank(),
        '/free_class': (context) => WatchFreeClass(),
        '/mock_test': (context) => StartTest(),
        '/report': (context) => TestReport(),
        '/subs': (context) => SubscribePage(),
        '/mocktest': (context) => mock_test(),
        '/profile': (context) => Profile(),
        '/livechat': (context) => ChatDetailPage(),
        '/vedio_class': (context) => VedioPlayScreen(),
        '/teacher_profile': (context) => TeachersProfile(),
        '/teacher_list': (context) => Teacher_List(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  AnimationController animationController;
  Animation<double> animation;
  bool isLogin = false;
  String courseId = "0";

  navigationPage() async {
    print('NavScreen');
    isLogin = await SharePreferencesHelper.getInstant()
        .getBool(SharePreferencesHelper.Is_Login);
    if (isLogin) {
      courseId = await SharePreferencesHelper.getInstant().getString(SharePreferencesHelper.CourseId);
      if (courseId != null && courseId != "0") {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
          (Route<dynamic> route) => false,
        );
      } else {
       /*Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => SelectGoal()),
          (Route<dynamic> route) => false,
        );*/
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
              (Route<dynamic> route) => false,
        );
      }
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Login()),
        (Route<dynamic> route) => false,
      );
    }
  }

  startTime() async {
    print('startTime');
    var _duration = new Duration(seconds: 7);
    return new Timer(_duration, navigationPage);
  }

  @override
  void initState() {
    super.initState();
    print('splash');
    animationController = new AnimationController(vsync: this, duration: new Duration(seconds: 2));
    animation = new CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    animation.addListener(() => this.setState(() {}));
    animationController.forward();
    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipOval(
                child: new Image.asset('assets/image/logo.jpg',
                    fit: BoxFit.cover,
                    height: animation.value * 150,
                    width: animation.value * 150),
              ),
              SizedBox(height: 10),
              Container(
                  child: Text('SMS INTERNATIONAL',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17)))
            ],
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: RichText(
                    text: TextSpan(
                      children: const <TextSpan>[
                        TextSpan(
                            text: 'Developed by',
                            style: TextStyle(color: Colors.white)),
                        TextSpan(
                            text: ' Greenma Infotech',
                            style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  )))
        ],
      ),
    );
  }
}
