import 'package:flutter/material.dart';
import 'package:greenma_info_school/api_manager/get_api.dart';
import 'package:greenma_info_school/model/question_bank/question_bank_sub_category_pdf_model.dart';
import 'package:greenma_info_school/screens/question_bank/pdf_viewer.dart';
import 'package:greenma_info_school/utils/sharedpreference_helper.dart';

class pdf_list extends StatefulWidget {
  String questionBankSubCategoryId;
  String questionBankSubCategoryName;

  pdf_list(this.questionBankSubCategoryId,this.questionBankSubCategoryName,{Key key}) : super(key: key);

  @override
  _pdf_listState createState() => _pdf_listState();
}

class _pdf_listState extends State<pdf_list> {

  String token;
  Future<QuestionBankSubCategoryPdfModel> _list;

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
      _list = ApiManager().getQuestionBankSubCategoryPdf(token, widget.questionBankSubCategoryId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Question Bank'),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                color: Colors.deepOrange),
          ),),
        body: Container(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.15,
                  child: Center(
                    child: Card(
                        elevation: 04,
                        child:Row(
                          children: [
                            Container(
                                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                                child: Row(
                                    children: [
                                      Column(children: [
                                        Container(
                                            width:MediaQuery.of(context).size.width*0.40,
                                            child: Text('',
                                              style: TextStyle(
                                                  color: Colors.deepOrangeAccent,fontSize: 15
                                              ),)),
                                        Container(
                                            margin:EdgeInsets.only(top:5),
                                            width:MediaQuery.of(context).size.width*0.40,
                                            child: Text(widget.questionBankSubCategoryName,style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),)),
                                      ]),
                                    ]))
                          ],
                        )
                    ),
                  )
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.65,
                child:FutureBuilder<QuestionBankSubCategoryPdfModel>(
                    future: _list,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var obj = snapshot.data;
                        return obj.chapters.data.length == 0
                            ? Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 300),
                            child: Container(
                              child: Text('No Data'),
                            ),
                          ),
                        ) : ListView.builder(
                            padding: const EdgeInsets.all(3),
                            itemCount: obj.chapters.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                                  child: Card(
                                      elevation: 04,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      child:Row(
                                        children: [
                                          Container(
                                              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                                              child: Row(
                                                  children: [
                                                    Column(children: [
                                                      Container(
                                                          width:MediaQuery.of(context).size.width*0.45,
                                                          child: Text(obj.chapters.data[index].name,
                                                            style: TextStyle(
                                                                color: Colors.black87
                                                            ),)),
                                                    ]),
                                                    SizedBox(width: 120,),
                                                    GestureDetector(
                                                      onTap: (){
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(builder: (context) => pdf_viewer(obj.chapters.data[index].pdfPath)),
                                                        );
                                                      },
                                                      child: Column(children: [
                                                        Icon(Icons.arrow_forward_ios, size: 17, color: Colors.black54,),
                                                      ]),
                                                    ),
                                                  ]))
                                        ],
                                      )
                                  ));
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
              ),
            ],
          ),
        ));
  }
}
