import 'package:shared_preferences/shared_preferences.dart';

class SharePreferencesHelper {
  static SharePreferencesHelper sharePreferenceHelper;
  static const String Is_Login = 'is_Login';
  static const String PACKAGE_STATUS = 'package_status';
  static const String Is_Save_password = 'is_Save_Password';
  static const String Access_Token = 'access_Token';
  static const String Id = 'id';
  static const String CourseId = 'course_id';
  static const String Full_Name = 'full_Name';
  static const String appointmentId = 'appointment_id';
  static const String Email = 'email';
  static const String Password = 'password';
  static const String Phone = 'phone';
  static const String Address = 'address';
  static const String Profile_Pic = 'profile_Pic';
  static const String DOB = 'DOB';
  static const String Gender = 'Gender';
  static const String Country = 'Country';
  static const String FileDownloaderStatus = 'file_download_status';

  static SharePreferencesHelper getInstant() {
    if (sharePreferenceHelper == null) {
      sharePreferenceHelper = new SharePreferencesHelper();
    }
    return sharePreferenceHelper;
  }

  Future<String> getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? null;
  }

  setString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<String> getAccessToken(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? "";
  }

  setAccessToken(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<String> getName(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? "";
  }

  setName(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<String> getMobile(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? "";
  }

  setMobile(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<String> getEmail(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? "";
  }

  setEmail(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<String> getAddress(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? "";
  }

  setAddress(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<int> getInt(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key) ?? null;
  }

  setInt(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  Future<double> getDouble(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key) ?? null;
  }

  setDouble(String key, double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(key, value);
  }

  Future<bool> getBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  setBool(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  clearPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
