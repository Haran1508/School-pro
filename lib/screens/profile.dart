import 'package:flutter/material.dart';
import 'package:greenma_info_school/utils/sharedpreference_helper.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  String token;
  String name;
  String email;
  String mblNo;
  String address;

  @override
  void initState() {
    super.initState();
    fun();
  }

  Future<void> fun() async {
    await getStore();
  }

  getStore() async {
    print('sharedPrefData');
    token = await SharePreferencesHelper.getInstant()
        .getAccessToken(SharePreferencesHelper.Access_Token);
    name = await SharePreferencesHelper.getInstant()
        .getName(SharePreferencesHelper.Full_Name);
    email = await SharePreferencesHelper.getInstant()
        .getEmail(SharePreferencesHelper.Email);
    mblNo = await SharePreferencesHelper.getInstant()
        .getMobile(SharePreferencesHelper.Phone);
    address = await SharePreferencesHelper.getInstant()
        .getAddress(SharePreferencesHelper.Address);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            profileView(name,mblNo,email,address) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget profileView(String name,String mblNo,String email,String address) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Stack(
            children: <Widget>[
              CircleAvatar(
                radius: 55,
                child: ClipOval(
                  child: Image.asset(
                    'assets/image/profile.png',
                    height: 75,
                    width: 65,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  bottom: 1,
                  right: 1,
                  child: Container(
                    height: 40,
                    width: 40,
                    child: Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ))
            ],
          ),
        ),
        Expanded(
            child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.deepOrange, Colors.orangeAccent])),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                  child: Container(
                    height: 50,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:TextFormField(
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(Icons.person_outline_rounded,color: Colors.white,size: 17,),
                              hintText: 'Name',
                              hintStyle:TextStyle(color: Colors.white)
                          ),
                          onSaved: (String value) {
                            // This optional block of code can be used to run
                            // code when the user saves the form.
                          },
                          initialValue: name,
                          validator: (String value) {
                            return (value != null && value.contains('@')) ? 'wrong' : null;
                          },
                        )
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 1.0, color: Colors.white70)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                  child: Container(
                    height: 50,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                          child:TextFormField(
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.email_outlined,color: Colors.white,size: 17,),
                                hintText: 'email',
                                hintStyle:TextStyle(color: Colors.white)
                            ),
                            onSaved: (String value) {
                              // This optional block of code can be used to run
                              // code when the user saves the form.
                            },
                            initialValue: email,
                            validator: (String value) {
                              return (value != null && value.contains('@')) ? 'wrong' : null;
                            },
                          )
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 1.0, color: Colors.white70)),
                  ),
                ),
               Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                  child: Container(
                    height: 50,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                          child:TextFormField(
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.drive_file_rename_outline,color: Colors.white,size: 17,),
                                hintText: 'address',
                                hintStyle:TextStyle(color: Colors.white)
                            ),
                            onSaved: (String value) {
                              // This optional block of code can be used to run
                              // code when the user saves the form.
                            },
                            initialValue:address,
                            validator: (String value) {
                              return (value != null && value.contains('@')) ? 'wrong' : null;
                            },
                          )
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 1.0, color: Colors.white70)),
                  ),
                ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                  child: Container(
                    height: 50,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.phone_enabled_outlined,color: Colors.white,size: 17,),
                            hintText: 'mobile number',
                            hintStyle:TextStyle(color: Colors.white)
                          ),
                          onSaved: (String value) {
                            // This optional block of code can be used to run
                            // code when the user saves the form.
                          },
                          initialValue: mblNo,
                          validator: (String value) {
                            return (value != null && value.contains('@')) ? 'wrong' : null;
                          },
                        )
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 1.0, color: Colors.white70)),
                  ),
                ),
                 SizedBox(height: 12,),
                 Align(
                   alignment: Alignment.center,
                   child: Container(
                     height: 30,
                     width: 70,
                     child: Align(
                       child: Text(
                         'SAVE',
                         style:
                             TextStyle(color: Colors.deepOrange, fontSize: 14),
                       ),
                     ),
                     decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(3)),
                   ),
                 )
              ],
            ),
          ),
        ))
      ],
    );
  }
}
