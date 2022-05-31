import 'package:flutter/material.dart';
import 'package:greenma_info_school/api_manager/get_api.dart';
import 'package:greenma_info_school/model/class/class_model.dart';
import 'package:greenma_info_school/utils/sharedpreference_helper.dart';

class UpcomingClass extends StatefulWidget {
  String heading;
  String classId;

  UpcomingClass(this.heading, this.classId, {Key key}) : super(key: key);

  @override
  _UpcomingClassState createState() => _UpcomingClassState();
}

class _UpcomingClassState extends State<UpcomingClass> {
  String token;
  Future<ClassModel> _list;

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
      _list = ApiManager().getClass(token, widget.classId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.heading),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(color: Colors.deepOrangeAccent),
          ),
        ),
        body: FutureBuilder<ClassModel>(
            future: _list,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var obj = snapshot.data;
                print('my_class');
                print(obj.classes.data);
                return obj.classes.data.length == 0
                    ? Align(
                  child:Container(
                    child: Text('No Data',style: TextStyle(color: Colors.black26),),
                  ),
                )
                    : ListView.builder(
                        padding: const EdgeInsets.all(6),
                        itemCount: obj.classes.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/vedio_class');
                            },
                            child: Card(
                                elevation: 04,
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.20,
                                            margin: EdgeInsets.symmetric(
                                              horizontal: 06,
                                            ),
                                            child: Image.asset(
                                              'assets/image/teacher.png',
                                              fit: BoxFit.cover,
                                              height: 65,
                                              width: 50,
                                            ),
                                          ),
                                          Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.60,
                                              child: Column(
                                                children: [
                                                  Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.60,
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 04,
                                                              horizontal: 10),
                                                      child: Row(
                                                        children: [
                                                          Text(obj.classes.data[index].subject.name,
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                          .grey[
                                                                      700])),
                                                          Text(
                                                              obj.classes.data[index].description,
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                          .grey[
                                                                      700])),
                                                        ],
                                                      )),
                                                  Container(
                                                      width: MediaQuery.of(context).size.width * 0.55,
                                                      child: Text(
                                                        obj.classes.data[index].chapter.name,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      )),
                                                  Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.60,
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 04,
                                                              horizontal: 10),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                              obj.classes.data[index].duration+' mins, by '+obj.classes.data[index].teacher.name,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      10)),
                                                        ],
                                                      )),
                                                ],
                                              )),
                                          Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Container(
                                              width: 20,
                                              height: 20,
                                              child: Icon(
                                                Icons.play_arrow_rounded,
                                                size: 20,
                                                color: Colors.deepOrange,
                                              ),
                                            ),
                                            elevation: 3,
                                          ),
                                        ],
                                      ),
                                      Divider(color: Colors.black54),
                                      Container(
                                          child: Row(
                                        children: [
                                          Icon(Icons.star,
                                              color: Colors.deepOrangeAccent,
                                              size: 10),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            obj.classes.data[index].course.name,
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.black),
                                          ),
                                        ],
                                      )),
                                    ],
                                  ),
                                )),
                          );
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
