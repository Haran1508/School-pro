import 'package:flutter/material.dart';

class TestReport extends StatefulWidget {
  @override
  _TestReportState createState() => _TestReportState();
}

class _TestReportState extends State<TestReport>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Report"),
        centerTitle: true,
        backgroundColor: new Color(0xffFF5C00),
      ),
      body: Container(
        margin:EdgeInsets.symmetric(vertical:10),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: MediaQuery.of(context).size.width * .5,
                        child: Text(
                          "Championship - Day 4",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.of(context).size.width * .5,
                        child: Text(
                          "Total mark : 32",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: MediaQuery.of(context).size.width * .5,
                        child: Text(
                          "Total time : 00:10:00",
                          style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: MediaQuery.of(context).size.width * .5,
                        child: Text(
                          "Result of attempt on",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: MediaQuery.of(context).size.width * .5,
                        child: Text(
                          "26-Sep-2021 5:17 PM",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    // Text(
                    //     "7/1, 2nd block more adress etc."),
                  ],
                ),
                Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Align(
                          child: Column(children: <Widget>[
                            Container(
                              child: Align(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.details,
                                      color: new Color(0xffFF5C00),
                                      size: 35,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Reattempt",
                                      style: TextStyle(
                                          color: new Color(0xffFF5C00),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ]),
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              height: 10,
              color: Colors.grey.shade600,
            ),
            TabBar(
              unselectedLabelColor: Colors.black,
              labelColor: Colors.red,
              tabs: [
                Tab(
                  text: 'Your Performance',
                ),
                Tab(
                  text: 'Your Answer',
                )
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            Expanded(
              child: TabBarView(
                children: [
//                Container(child: Center(child: Text('people'))),
                  PerformanceTab(),
                  YourAnswerTab()
                ],
                controller: _tabController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PerformanceTab extends StatefulWidget {
  @override
  _PerformanceTabState createState() => _PerformanceTabState();
}

class _PerformanceTabState extends State<PerformanceTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey.shade100,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(7),
              margin: EdgeInsets.all(7),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/image/reward_bg.jpeg"),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: MediaQuery.of(context).size.width * .5,
                              child: Text(
                                "Hey Indhu , Keep",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Align(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              width: MediaQuery.of(context).size.width * .5,
                              child: Text(
                                "improving!",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: MediaQuery.of(context).size.width * .5,
                              child: Text(
                                "Your Score",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w200),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: MediaQuery.of(context).size.width * .5,
                              child: Text(
                                "5/40",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                      Container(
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: EdgeInsets.only(left: 10, right: 5),
                              child: Align(
                                child: Column(children: <Widget>[
                                  Container(
                                    child: Align(
                                      child: Container(
                                          width: 80,
                                          height: 80,
                                          child: Image.asset(
                                              "assets/image/trophy.jpeg")),
                                    ),
                                  )
                                ]),
                              )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    height: 2,
                    color: Colors.white70,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white70)),
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Attempt",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          Container(
                            child: Text(
                              "100%",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800),
                            ),
                          )
                        ]),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white70)),
                                child: Icon(
                                  Icons.timer,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Time",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          Container(
                            child: Text(
                              "1.28 min/3.00 min",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800),
                            ),
                          )
                        ]),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white70)),
                                child: Icon(
                                  Icons.bookmark,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Rank",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          Container(
                            child: Text(
                              "- -",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800),
                            ),
                          )
                        ]),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white70,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: MediaQuery.of(context).size.width * .5,
                          child: Text(
                            "Total Questions",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Align(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          width: MediaQuery.of(context).size.width * .5,
                          child: Text(
                            "10",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                          padding: EdgeInsets.all(8),
                          width: 40.0,
                          height: 40.0,
                          child: Center(
                            child: Icon(
                              Icons.paste,
                              color: new Color(0xffFF5C00),
                            ),
                          ),
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.deepOrange.shade100)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white70,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.check_circle_outline,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Container(
                            child: Text(
                              "Attempted",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black26,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "10",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.check_circle_outline,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Container(
                            child: Text(
                              "UnAttempted",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black26,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "0",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.circle,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Container(
                            child: Text(
                              "Correct",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black26,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "3",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.circle,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Container(
                            child: Text(
                              "Incorrect",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black26,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "7",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    child: Text(
                      "Subject Marks",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    width: MediaQuery.of(context).size.width,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.circle,
                            color: Colors.green,
                            size: 10,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Container(
                            child: Text(
                              "Correct",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black26,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.circle,
                            color: Colors.red,
                            size: 10,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Container(
                            child: Text(
                              "Incorrect",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black26,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.circle,
                            color: Colors.grey,
                            size: 10,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Container(
                            child: Text(
                              "UnAttempted",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black26,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.white,
                    height: 250,
                    child: ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return RecentlyCard(
                            "Figma Design", "24", "assets/image/banner.jpeg");
                      },
                    ),
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
  final String title, count, imagePath;

  RecentlyCard(
      this.title,
      this.count,
      this.imagePath,
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Over All",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(8),
                        width: 27.0,
                        height: 27.0,
                        child: Center(
                            child: Text(
                              "0",
                              style: TextStyle(color: Colors.white, fontSize: 10),
                            )),
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle, color: Colors.green)),
                    SizedBox(
                      width: 2,
                    ),
                    Container(
                        padding: EdgeInsets.all(8),
                        width: 27.0,
                        height: 27.0,
                        child: Center(
                            child: Text(
                              "0",
                              style: TextStyle(color: Colors.white, fontSize: 10),
                            )),
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red)),
                    SizedBox(
                      width: 4,
                    ),
                    Container(
                        padding: EdgeInsets.all(8),
                        width: 27.0,
                        height: 27.0,
                        child: Center(
                            child: Text(
                              "0",
                              style: TextStyle(color: Colors.black, fontSize: 10),
                            )),
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey)),
                  ],
                ),
              ],
            ),
            Container(
                child: Column(
                  children: [
                    Container(
                      width: 50,
                      height: 30,
                      color: new Color(0xffFF5C00),
                      child: Center(
                        child: Text(
                          "5/40",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade100),
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.circle_outlined,
                            color: Colors.grey,
                            size: 15,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            "30 %",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Container(
                            child: Text(
                              "Accuracy",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black26,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class YourAnswerTab extends StatefulWidget {
  @override
  _YourAnswerTabState createState() => _YourAnswerTabState();
}

class _YourAnswerTabState extends State<YourAnswerTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 250,
      child: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return YourAnsCard(
              "Figma Design", "24", "assets/image/banner.jpeg");
        },
      ),
    );
  }
}

class YourAnsCard extends StatelessWidget {
  final String title, count, imagePath;

  YourAnsCard(
      this.title,
      this.count,
      this.imagePath,
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                "Q1",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                children: [
                  Text(
                    "Identify the acid and base from which k2so4 is derived.",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.white,
                    height: 150,
                    child: ListView.builder(
                      itemCount: 4,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return OptionsCard(
                            "Figma Design", "24", "assets/image/banner.jpeg");
                      },
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Colors.grey.shade100,
                border: Border.all(color: Colors.grey.shade100),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            child: Row(
                              children: [
                                Text(
                                  "YOUR ANSWER",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "INCORRECT",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          width: MediaQuery.of(context).size.width * .5,
                          child: Text(
                            "Time Spent",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: MediaQuery.of(context).size.width * .5,
                          child: Text(
                            "00:06",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: MediaQuery.of(context).size.width * .5,
                          child: Text(
                            "Chemistry",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: MediaQuery.of(context).size.width * .5,
                          child: Text(
                            "Normal Salts",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            child: Text(
                              "UNKNOWN",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OptionsCard extends StatelessWidget {
  final String title, count, imagePath;

  OptionsCard(
      this.title,
      this.count,
      this.imagePath,
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        color: Colors.white,
        child: Row(
          children: [
            Icon(
              Icons.circle_outlined,
              color: Colors.green,
            ),
            SizedBox(
              width: 2,
            ),
            Text(
              "KN)2,HCL",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.black26,
                  fontSize: 14,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}