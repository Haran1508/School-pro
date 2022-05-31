import 'package:flutter/material.dart';
import 'package:greenma_info_school/api_manager/get_api.dart';
import 'package:greenma_info_school/model/teachers/teachers_model.dart';
import 'package:greenma_info_school/utils/sharedpreference_helper.dart';

class Teacher_List extends StatefulWidget {
  const Teacher_List({Key key}) : super(key: key);

  @override
  _Teacher_ListState createState() => _Teacher_ListState();
}

class _Teacher_ListState extends State<Teacher_List> {
  String token;
  Future<TeachersModel> _list;

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
      _list = ApiManager().getTeachers(token);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Teachers'),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                color: Colors.deepOrange),
          ),),
        body:  FutureBuilder<TeachersModel>(
            future: _list,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var obj = snapshot.data;
                return obj.teachers.data.length == 0
                    ? Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 300),
                    child: Container(
                      child: Text('No Data'),
                    ),
                  ),
                )
                    :   ListView.builder(
                    padding: const EdgeInsets.all(3),
                    itemCount: obj.teachers.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, '/teacher_profile');
                            },
                            child: Card(
                                elevation: 04,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child:Row(
                                  children: [
                                    Container(height:MediaQuery.of(context).size.height*0.18, width:20, decoration: BoxDecoration(
                                        color: Colors.deepOrangeAccent,
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10))
                                    )),
                                    Container(
                                        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 15),
                                        child: Row(
                                            children: [
                                              Column(children: [
                                                Container(
                                                    width:MediaQuery.of(context).size.width*0.55,
                                                    child: Text(obj.teachers.data[index].name,
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 16,
                                                          color: Colors.deepOrangeAccent
                                                      ),)),
                                                Container(
                                                    margin:EdgeInsets.only(top:5),
                                                    width:MediaQuery.of(context).size.width*0.55,
                                                    child: Text('',
                                                      style: TextStyle(color: Colors.black38,
                                                          fontSize:12,fontWeight: FontWeight.bold),)),
                                                Container(
                                                    margin:EdgeInsets.only(top:2),
                                                    width:MediaQuery.of(context).size.width*0.55,
                                                    child: Text('',
                                                      style: TextStyle(color: Colors.black38,
                                                          fontSize:12,fontWeight: FontWeight.bold),)),
                                                obj.teachers.data[index].experience !=null? Container(
                                                    margin:EdgeInsets.only(top:2),
                                                    width:MediaQuery.of(context).size.width*0.55,
                                                    child: Text(obj.teachers.data[index].experience+' Years Experience',
                                                      style: TextStyle(color: Colors.black38,fontSize:12,fontWeight: FontWeight.bold),)):
                                                Container(
                                                    margin:EdgeInsets.only(top:2),
                                                    width:MediaQuery.of(context).size.width*0.55,
                                                    child: Text( ' Years Experience',
                                                      style: TextStyle(color: Colors.black38,fontSize:12,fontWeight: FontWeight.bold),)),
                                              ]),
                                              Container(
                                                width: MediaQuery.of(context).size.width * 0.20,
                                                child: ClipOval(
                                                  child: Image.asset(
                                                    'assets/image/teacher.png',
                                                    fit: BoxFit.cover,
                                                    height: 75,
                                                    width: 44,
                                                  ),
                                                ),
                                              ),
                                            ]))
                                  ],
                                )
                            ),
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
            }));

  }

}
