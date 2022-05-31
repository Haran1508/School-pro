import 'package:flutter/material.dart';
import 'package:greenma_info_school/api_manager/get_api.dart';
import 'package:greenma_info_school/model/question_bank/question_bank_model.dart';
import 'package:greenma_info_school/screens/question_bank/question_download.dart';
import 'package:greenma_info_school/utils/sharedpreference_helper.dart';

class QuestionBank extends StatefulWidget {
  const QuestionBank({Key key}) : super(key: key);

  @override
  _QuestionBankState createState() => _QuestionBankState();
}

class _QuestionBankState extends State<QuestionBank> {
  String token;
  Future<QuestionBankModel> _list;

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
      _list = ApiManager().getQuestionBank(token);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Question Bank'),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(color: Colors.deepOrange),
          ),
        ),
        body: FutureBuilder<QuestionBankModel>(
            future: _list,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var obj = snapshot.data;
                return obj.category.data.length == 0
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
                        itemCount: obj.category.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              child: Card(
                                  elevation: 04,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.11,
                                          width: 20,
                                          decoration: BoxDecoration(
                                              color: Colors.deepOrangeAccent,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  bottomLeft:
                                                      Radius.circular(10)))),
                                      Container(
                                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                            Column(children: [
                                              Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.75,
                                                  child: Text(
                                                    obj.category.data[index].name,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors
                                                            .deepOrangeAccent),
                                                  )),
                                              Container(
                                                  margin:
                                                      EdgeInsets.only(top: 5),
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.30,
                                                  child: Text(
                                                    obj.category.data[index].metaTitle !=null&&obj.category.data[index].metaKeywords!=null?
                                                    obj.category.data[index].metaTitle  +' | '+obj.category.data[index].metaKeywords:'',
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  )),
                                            ]),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          QuestionDownload( obj.category.data[index].id.toString())),
                                                );
                                              },
                                              child: Column(children: [
                                                Icon(
                                                  Icons.arrow_forward_ios,
                                                  size: 20,
                                                  color: Colors.deepOrange,
                                                ),
                                              ]),
                                            ),
                                          ]))
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
            })
    );
  }
}
