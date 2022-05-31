import 'package:flutter/material.dart';
import 'package:greenma_info_school/api_manager/get_api.dart';
import 'package:greenma_info_school/model/quiz/quiz_model.dart';
import 'package:greenma_info_school/utils/sharedpreference_helper.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String token;
  Future<QuizModel> _list;

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
      _list = ApiManager().getQuiz(token);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Quick Quiz'),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(color: Colors.deepOrange),
          ),
        ),
        body: FutureBuilder<QuizModel>(
            future: _list,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var obj = snapshot.data;
                return obj.quizzes.data.length == 0
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
                        padding: const EdgeInsets.all(5),
                        itemCount: obj.quizzes.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
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
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, '/mock_test');
                                          //Get.to(()=> QuizScreen() );
                                          //Get.find<QuizController>().startTimer();
                                        },
                                        child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 10),
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.8,
                                                  child: Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: Text(
                                                      'Course : ' +
                                                          obj.quizzes.data[index]
                                                              .course.name,
                                                      style: TextStyle(
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          color: Colors.black),
                                                    ),
                                                  )
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.8,
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Topic : ' +
                                                              obj
                                                                  .quizzes
                                                                  .data[index]
                                                                  .subject
                                                                  .name,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        Icon(
                                                          Icons.play_arrow_rounded,
                                                          size: 20,
                                                          color:
                                                              Colors.deepOrange,
                                                        ),
                                                      ]),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 5),
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.77,
                                                  child: Row(
                                                    children: <Widget>[
                                                      Text(
                                                        'Question - ',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .deepOrangeAccent,
                                                            fontSize: 12),
                                                      ),
                                                      Spacer(),
                                                      Text(
                                                        'Time per quize -  ' +
                                                            obj
                                                                .quizzes
                                                                .data[index]
                                                                .duration +
                                                            ' sec',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .deepOrangeAccent,
                                                            fontSize: 12),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )),
                                      )
                                    ],
                                  )));
                        });
              } else if (snapshot.connectionState == ConnectionState.done) {
                return Center(child: Text('No Data'));
              } else {
                return Center(
                    child: CircularProgressIndicator(
                  color: Colors.orange,
                  strokeWidth: 2,
                ));
              }
            }));
  }
}
