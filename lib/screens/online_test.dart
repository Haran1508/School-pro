import 'package:flutter/material.dart';
import 'package:greenma_info_school/api_manager/get_api.dart';
import 'package:greenma_info_school/config/colors.dart';
import 'package:greenma_info_school/model/test/online_test_model.dart';
import 'package:greenma_info_school/utils/sharedpreference_helper.dart';

class OnlineTestScreen extends StatefulWidget {
  @override
  _OnlineTestScreenState createState() => _OnlineTestScreenState();
}

class _OnlineTestScreenState extends State<OnlineTestScreen>
    with TickerProviderStateMixin {
  TabController _tabController;

  String token;
  Future<OnlineTestModel> _list;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
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
      _list = ApiManager().getOnlineTest(token);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          TabBar(
            unselectedLabelColor: Colors.black,
            labelColor: Colors.red,
            indicatorColor: primary,
            tabs: [
              Tab(
                text: 'All Test',
              ),
              Tab(
                text: 'Attempted',
              )
            ],
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.tab,
          ),
          Expanded(
            child: TabBarView(
              children: [
//                Container(child: Center(child: Text('people'))),

                _buildStateAllTest(context),
                _buildStateAttempt(),
              ],
              controller: _tabController,
            ),
          ),
        ],
      ),
    );
  }

  Container _buildStateAllTest(BuildContext context) {
    return Container(
        child: FutureBuilder<OnlineTestModel>(
            future: _list,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var obj = snapshot.data;
                return obj.onlineTests.data.length == 0
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
                    padding: const EdgeInsets.all(3),
                    itemCount: obj.onlineTests.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 5, vertical: 2),
                          child: Card(
                              elevation: 04,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                child: Column(
                                  children: [
                                    Row(children: [
                                      Column(children: [
                                        Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.80,
                                            child: Text(
                                              obj.onlineTests.data[index].name,
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  color: Colors.black),
                                            )),
                                        Container(
                                          margin: EdgeInsets.only(top: 5),
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.80,
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                'Duration - '+obj.onlineTests.data[index].duration,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12),
                                              ),
                                              Spacer(),
                                              Text(
                                                'Score - '+'',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]),
                                    ]),
                                    Divider(
                                      color: Colors.black,
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                        width: 125,
                                        height: 30,
                                        alignment: Alignment.centerRight,
                                        child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  30)),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, '/mock_test');
                                            },
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Resume Test',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Icon(
                                                  Icons
                                                      .arrow_forward_ios_sharp,
                                                  color: Colors.white,
                                                  size: 15,
                                                ),
                                              ],
                                            ),
                                          ),
                                          /*ListTile(
                                  trailing:
                                  title:
                                ),*/
                                          onPressed: () {},
                                          color: Colors.deepOrangeAccent,
                                          textColor: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )));
                    });
              } else if (snapshot.connectionState == ConnectionState.done) {
                return Center(child: Text('No Data'));
              } else {
                return Center(child: CircularProgressIndicator(
                  color: Colors.orange,
                  strokeWidth: 2,
                ));
              }
            }));
  }

  Container _buildStateAttempt() {
    return Container(
        child: ListView.builder(
            padding: const EdgeInsets.all(3),
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  child: Card(
                      elevation: 04,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Container(
                        padding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        child: Column(
                          children: [
                            Row(children: [
                              Column(children: [
                                Container(
                                    width:
                                    MediaQuery.of(context).size.width * 0.80,
                                    child: Text(
                                      'Daignostic Test Grade 10',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    )),
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  width: MediaQuery.of(context).size.width * 0.80,
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        'Duration - 50 mints',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 12),
                                      ),
                                      Spacer(),
                                      Text(
                                        'Score - 59/100',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                            ]),
                            Divider(
                              color: Colors.black,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 105,
                                height: 30,
                                alignment: Alignment.centerRight,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.pushNamed(context, '/report');
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          'Report',
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 12),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios_sharp,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                      ],
                                    ),
                                  ),
                                  /*ListTile(
                                  trailing:
                                  title:
                                ),*/
                                  onPressed: () {},
                                  color: Colors.deepOrangeAccent,
                                  textColor: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      )));
            }));
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
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
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
                                    fontSize: 20,
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
                            height: 20,
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
                                    fontSize: 30,
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
                          alignment: Alignment.center,
                          child: Padding(
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: Align(
                                child: Column(children: <Widget>[
                                  Container(
                                    child: Align(
                                      child: Container(
                                          width: 100,
                                          height: 100,
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
                  SizedBox(
                    height: 10,
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
            SizedBox(
              height: 10,
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
                                fontSize: 20,
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
                                fontSize: 30,
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
                          width: 60.0,
                          height: 60.0,
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
            SizedBox(
              height: 10,
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
        padding: EdgeInsets.all(10),
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
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(8),
                        width: 30.0,
                        height: 30.0,
                        child: Center(
                            child: Text(
                              "0",
                              style: TextStyle(color: Colors.white, fontSize: 12),
                            )),
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle, color: Colors.green)),
                    SizedBox(
                      width: 2,
                    ),
                    Container(
                        padding: EdgeInsets.all(8),
                        width: 30.0,
                        height: 30.0,
                        child: Center(
                            child: Text(
                              "0",
                              style: TextStyle(color: Colors.white, fontSize: 12),
                            )),
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red)),
                    SizedBox(
                      width: 4,
                    ),
                    Container(
                        padding: EdgeInsets.all(8),
                        width: 30.0,
                        height: 30.0,
                        child: Center(
                            child: Text(
                              "0",
                              style: TextStyle(color: Colors.black, fontSize: 12),
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
                      width: 70,
                      height: 40,
                      color: new Color(0xffFF5C00),
                      child: Center(
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
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
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
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            "30 %",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
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