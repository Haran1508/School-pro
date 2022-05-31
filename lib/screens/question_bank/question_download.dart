import 'package:flutter/material.dart';
import 'package:greenma_info_school/api_manager/get_api.dart';
import 'package:greenma_info_school/model/question_bank/question_bank_sub_category_model.dart';
import 'package:greenma_info_school/screens/question_bank/pdf_list.dart';
import 'package:greenma_info_school/utils/sharedpreference_helper.dart';

class QuestionDownload extends StatefulWidget {
  String questionBankID;

  QuestionDownload(this.questionBankID, {Key key}) : super(key: key);

  @override
  _QuestionDownloadState createState() => _QuestionDownloadState();
}

class _QuestionDownloadState extends State<QuestionDownload> {
  String token;
  Future<QuestionBankSubCategoryModel> _list;

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
      _list =
          ApiManager().getQuestionBankSubCategory(token, widget.questionBankID);
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
        body: FutureBuilder<QuestionBankSubCategoryModel>(
            future: _list,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var obj = snapshot.data;
                return obj.subCategory.data.length == 0
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
                        itemCount: obj.subCategory.data.length,
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
                                          padding: EdgeInsets.symmetric(
                                              vertical: 15, horizontal: 10),
                                          child: Row(children: [
                                            Column(children: [
                                              Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.40,
                                                  child: Text(
                                                    obj.subCategory.data[index].name,
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
                                                      0.40,
                                                  child: Text(
                                                    obj.subCategory.data[index].chapterscount.toString()+ ' Chapters' + ' | '+''+' PDFs',
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  )),
                                            ]),
                                            SizedBox(
                                              width: 120,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          pdf_list( obj.subCategory.data[index].id.toString(),obj.subCategory.data[index].name.toString())),
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
            }));
  }
}
