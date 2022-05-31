import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greenma_info_school/api_manager/get_api.dart';
import 'package:greenma_info_school/model/plan/plan_model.dart';
import 'package:greenma_info_school/screens/dashboard/home.dart';
import 'package:greenma_info_school/utils/sharedpreference_helper.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class SubscribePage extends StatefulWidget {
  @override
  _SubscribePageState createState() => _SubscribePageState();
}

class _SubscribePageState extends State<SubscribePage> {
  String token;
  Future<PlanModel> _list;
  Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    fun();
  }

  Future<void> fun() async {
    await getStore();
    await getData();
    await getRazorPay();
  }

  getStore() async {
    print('sharedPrefData');
    token = await SharePreferencesHelper.getInstant()
        .getAccessToken(SharePreferencesHelper.Access_Token);
  }

  getData() {
    setState(() {
      _list = ApiManager().getPlan(token);
    });
  }

  getRazorPay() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout(String amount) async {
    var options = {
      'key': 'rzp_test_93exgT15yYKU6i',
      'amount': amount,
      'name': 'School Management',
      'description': 'Package',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '9876543210', 'email': 'school@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('Success Response: $response');
    print(response.paymentId);
    Fluttertoast.showToast(
        msg: "Payment Succeed", toastLength: Toast.LENGTH_SHORT);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Error Response: $response');
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message,
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External SDK Response: $response');
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName,
        toastLength: Toast.LENGTH_SHORT);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.7), BlendMode.dstATop),
                image: AssetImage('assets/image/quiz_bg.jpg'),
                fit: BoxFit.fitHeight),
          ),
        ),
        SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 25, bottom: 5),
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    width: MediaQuery.of(context).size.width,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()),
                          );
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Text(
                      "IIT JEE Subscription",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
//                ToggleButton(),
//                SizedBox(
//                  height: 10,
//                ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 17,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Text(
                          "Indian's Best Educators",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Text(
                          "Interactive Live Classes",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Text(
                          "Structured Courses & PDFs",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Text(
                          "Live Tests & Quizzes",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.close,
                            color: Colors.grey,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Text(
                              "1:1 Live Mentorship",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.close,
                            color: Colors.grey,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Text(
                              "Live Doubt Solving",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.subscriptions,
                          color: Color(0xffFF5C00),
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Flexible(
                            child: Text(
                              "Subscription prices will increase on October 1st",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color(0xffFF5C00),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                      height: 230,
                      child: FutureBuilder<PlanModel>(
                          future: _list,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var obj = snapshot.data;
                              return obj.plans.length == 0
                                  ? Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 300),
                                        child: Container(
                                          child: Text(
                                            'No Data',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 17),
                                          ),
                                        ),
                                      ),
                                    )
                                  : ListView.builder(
                                      itemCount: obj.plans.length,
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Card(
                                            elevation: 04,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  top: 10, bottom: 10),
                                              child: Row(
                                                children: [
                                                  Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.80,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 10,
                                                              horizontal: 10),
                                                      child: Container(
                                                        child: Column(
                                                            children: [
                                                              Container(
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      obj
                                                                          .plans[
                                                                              index]
                                                                          .title,
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          color:
                                                                              Colors.black),
                                                                    ),
                                                                    Text(
                                                                      '\u20B9 ' +
                                                                          obj.plans[index]
                                                                              .amount +
                                                                          ' / ' +
                                                                          obj.plans[index].validityDays +
                                                                          ' days',
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.black),
                                                                    ),
                                                                  ],
                                                                ),
                                                                width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Container(
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    obj.plans[index].description !=
                                                                            null
                                                                        ? Text(
                                                                            obj.plans[index].description,
                                                                            style:
                                                                                TextStyle(fontSize: 10, color: Colors.deepOrange),
                                                                          )
                                                                        : Text(
                                                                            '',
                                                                            style:
                                                                                TextStyle(fontSize: 10, color: Colors.deepOrange),
                                                                          ),
                                                                    Text(
                                                                      '\u20B9 ' +
                                                                          obj.plans[index]
                                                                              .total,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              10,
                                                                          color:
                                                                              Colors.black54),
                                                                    ),
                                                                  ],
                                                                ),
                                                                width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                              ),
                                                            ]),
                                                      )),
                                                  Container(
                                                    height: 25,
                                                    width: 25,
                                                      child: GestureDetector(
                                                    onTap: () {
                                                      openCheckout(obj.plans[index].total);
                                                    },
                                                    child: Icon(
                                                      Icons.arrow_forward_ios_sharp, size: 12,
                                                    ),
                                                  ))
                                                ],
                                              ),
                                            ));
                                      },
                                    );
                            } else if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return Center(child: Text('No Data'));
                            } else {
                              return Center(
                                  child: CircularProgressIndicator(
                                color: Colors.orange,
                                strokeWidth: 2,
                              ));
                            }
                          }))
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
