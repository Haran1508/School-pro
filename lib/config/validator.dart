import 'package:greenma_info_school/config/strings.dart';

class CommonValidator {
  static String mobileNumValidationWithEmpty(String value) {
    if (value.isEmpty) {
      return StringHelper.error_msg_empty_mobile;
    } else if (value.length < 10) {
      return StringHelper.error_msg_invalid_mobile_10_digits;
    } else if (value.length > 10) {
      return StringHelper.error_msg_invalid_mobile_10_digits;
    } else {
      return null;
    }
  }

  static String emailValidation(String value) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    if (value.isEmpty) {
      return StringHelper.error_msg_empty_email;
    } else if (!(new RegExp(p).hasMatch(value))) {
      return StringHelper.error_msg_invalid_email;
    } else {
      return null;
    }
  }

  static String emptyValidation(String value) {
    return value.isEmpty ? StringHelper.error_empty_value : null;
  }
}
