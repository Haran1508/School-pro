import 'dart:convert';

import 'package:greenma_info_school/config/strings.dart';
import 'package:greenma_info_school/model/class/class_model.dart';
import 'package:greenma_info_school/model/class/free_class_model.dart';
import 'package:greenma_info_school/model/dashboard/dashbord_model.dart';
import 'package:greenma_info_school/model/quiz/quiz_model.dart';
import 'package:greenma_info_school/model/teachers/teachers_model.dart';
import 'package:greenma_info_school/model/test/online_test_model.dart';
import 'package:greenma_info_school/model/plan/plan_model.dart';
import 'package:greenma_info_school/model/question_bank/question_bank_model.dart';
import 'package:greenma_info_school/model/question_bank/question_bank_sub_category_model.dart';
import 'package:greenma_info_school/model/question_bank/question_bank_sub_category_pdf_model.dart';
import 'package:http/http.dart' as http;

class ApiManager {

  //dashboard
  Future<DashBoardModel> getDashBoard(String token) async {
    Map data;
    var list;
    String url = StringHelper.BASEURL + '/dashboard';
    print(url);
    final http.Response response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token',
    });
    data = json.decode(response.body);
    print(data.toString());
    try {
      if (response.statusCode == 200) {
        print('dashboardFetched');
        list = DashBoardModel.fromJson(data);
        print(list.toString());
      }
    } catch (Exception) {
      print(Exception);
    }
    return list;
  }

  //Free class
  Future<FreeClassModel> getFreeClass(String token) async {
    Map data;
    var list;
    String url = StringHelper.BASEURL + '/free-classes';
    print(url);
    final http.Response response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token',
    });
    data = json.decode(response.body);
    print(data.toString());
    try {
      if (response.statusCode == 200) {
        print('freeClassFetched');
        list = FreeClassModel.fromJson(data);
        print(list.toString());
      }
    } catch (Exception) {
      print(Exception);
    }
    return list;
  }

  //Online test
  Future<OnlineTestModel> getOnlineTest(String token) async {
    Map data;
    var list;
    String url = StringHelper.BASEURL + '/online-test';
    print(url);
    final http.Response response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token',
    });
    data = json.decode(response.body);
    print(data.toString());
    try {
      if (response.statusCode == 200) {
        print('onlineTestFetched');
        list = OnlineTestModel.fromJson(data);
        print(list.toString());
      }
    } catch (Exception) {
      print(Exception);
    }
    return list;
  }

  //Question bank
  Future<QuestionBankModel> getQuestionBank(String token) async {
    Map data;
    var list;
    String url = StringHelper.BASEURL + '/question-bank';
    print(url);
    final http.Response response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token',
    });
    data = json.decode(response.body);
    print(data.toString());
    try {
      if (response.statusCode == 200) {
        print('questionBankFetched');
        list = QuestionBankModel.fromJson(data);
        print(list.toString());
      }
    } catch (Exception) {
      print(Exception);
    }
    return list;
  }

  //Question bank category
  Future<QuestionBankSubCategoryModel> getQuestionBankSubCategory(String token, String questionBankId) async {
    Map data;
    var list;
    String url = StringHelper.BASEURL + '/question-bank/' + questionBankId;
    print(url);
    final http.Response response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token',
    });
    data = json.decode(response.body);
    print(data.toString());
    try {
      if (response.statusCode == 200) {
        print('questionBankFetched');
        list = QuestionBankSubCategoryModel.fromJson(data);
        print(list.toString());
      }
    } catch (Exception) {
      print(Exception);
    }
    return list;
  }

  //Question bank category pdf
  Future<QuestionBankSubCategoryPdfModel> getQuestionBankSubCategoryPdf(String token, String questionBankCatId) async {
    Map data;
    var list;
    String url = StringHelper.BASEURL + '/question-bank-chapter/' + questionBankCatId;
    print(url);
    final http.Response response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token',
    });
    data = json.decode(response.body);
    print(data.toString());
    try {
      if (response.statusCode == 200) {
        print('questionBankFetched');
        list = QuestionBankSubCategoryPdfModel.fromJson(data);
        print(list.toString());
      }
    } catch (Exception) {
      print(Exception);
    }
    return list;
  }

  //Class
  Future<ClassModel> getClass(String token, String classId) async {
    Map data;
    var list;
    String url = StringHelper.BASEURL + '/student-class?type=' + classId;
    print(url);
    final http.Response response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token',
    });
    data = json.decode(response.body);
    print(data.toString());
    try {
      if (response.statusCode == 200) {
        print('questionBankFetched');
        list = ClassModel.fromJson(data);
        print(list.toString());
      }
    } catch (Exception) {
      print(Exception);
    }
    return list;
  }

  //Plan
  Future<PlanModel> getPlan(String token) async {
    Map data;
    var list;
    String url = StringHelper.BASEURL + '/plans';
    print(url);
    final http.Response response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token',
    });
    data = json.decode(response.body);
    print(data.toString());
    try {
      if (response.statusCode == 200) {
        print('questionBankFetched');
        list = PlanModel.fromJson(data);
        print(list.toString());
      }
    } catch (Exception) {
      print(Exception);
    }
    return list;
  }

  //Quiz
  Future<QuizModel> getQuiz(String token) async {
    Map data;
    var list;
    String url = StringHelper.BASEURL + '/quizzes';
    print(url);
    final http.Response response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token',
    });
    data = json.decode(response.body);
    print(data.toString());
    try {
      if (response.statusCode == 200) {
        print('questionBankFetched');
        list = QuizModel.fromJson(data);
        print(list.toString());
      }
    } catch (Exception) {
      print(Exception);
    }
    return list;
  }

  //Teachers
  Future<TeachersModel> getTeachers(String token) async {
    Map data;
    var list;
    String url = StringHelper.BASEURL + '/teachers';
    print(url);
    final http.Response response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token',
    });
    data = json.decode(response.body);
    print(data.toString());
    try {
      if (response.statusCode == 200) {
        print('questionBankFetched');
        list = TeachersModel.fromJson(data);
        print(list.toString());
      }
    } catch (Exception) {
      print(Exception);
    }
    return list;
  }
}
