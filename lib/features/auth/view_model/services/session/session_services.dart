import 'dart:convert';
import 'package:chatterbox/features/auth/model/user_model.dart';
import 'package:flutter/foundation.dart';
import '../storage/local_storage.dart';

class SessionController {
  LocalStorage sharedPreferenceClass = LocalStorage();
  static final SessionController _session = SessionController._internel();

  bool? isLogin;
  UserModel user = UserModel();

  factory SessionController() {
    return _session;
  }

  SessionController._internel() {
    isLogin = false;
  }

  Future<void> saveUserInPreference(dynamic response) async {
    try {
      sharedPreferenceClass.setValue('user-data', jsonEncode(response));
      sharedPreferenceClass.setValue('isLogin', 'true');
    } catch (e, stacktrace) {
      if (kDebugMode) {
        print(stacktrace);
        print(e);
      }
    }
  }

  Future<void> getUserFromPreference() async {
    try {
      var userData = await sharedPreferenceClass.readValue('user-data');
      var isLogin = await sharedPreferenceClass.readValue('isLogin');

      if (userData != null && userData.isNotEmpty) {
        SessionController().user = UserModel.fromJson(jsonDecode(userData));
      }
      SessionController().isLogin = isLogin == 'true' ? true : false;
    } catch (e, stacktrace) {
      if (kDebugMode) {
        print(stacktrace);
        print(e.toString());
      }
    }
  }
}
