import 'package:flutter/material.dart';
import 'package:greenma_info_school/api_manager/get_api.dart';
import 'package:greenma_info_school/model/class/free_class_model.dart';
import 'package:greenma_info_school/utils/sharedpreference_helper.dart';

class Free_Class extends StatefulWidget {
  const Free_Class({Key key}) : super(key: key);

  @override
  _Free_ClassState createState() => _Free_ClassState();
}

class _Free_ClassState extends State<Free_Class> {
  String token;
  Future<FreeClassModel> _list;

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
      _list = ApiManager().getFreeClass(token);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<FreeClassModel>(
            future: _list,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var obj = snapshot.data;
                return obj.freeClasses.data.length == 0
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
                        scrollDirection: Axis.vertical,
                        itemCount: obj.freeClasses.data.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/vedio_class');
                            },
                            child: UpcomingCard(
                              obj.freeClasses.data[index].subject.name,
                              obj.freeClasses.data[index].description,
                              obj.freeClasses.data[index].duration,
                              obj.freeClasses.data[index].teacher.name,
                              obj.freeClasses.data[index].course.name,
                            ),
                          );
                        },
                      );
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
      padding: EdgeInsets.only(top: 15, left: 10, right: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 100.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/image/banner.jpeg"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 5),
              child: Text(
                subject,
                style: TextStyle(
                    color: Colors.grey[400],
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                    child: Text(description, style: TextStyle(fontSize: 13))),
                Container(
                    padding: EdgeInsets.all(06),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text('Join Now', style: TextStyle(fontSize: 10)))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 5),
              child: Text(
                duration + ' , By ' + teacherName,
                style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.normal,
                    fontSize: 12.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
