// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:chatterbox/configs/app_configs/config.dart';
import 'package:chatterbox/configs/routes/route_names.dart';
import 'package:chatterbox/configs/utils/utils.dart';
import 'package:chatterbox/features/auth/model/user_model.dart';
import 'package:chatterbox/features/auth/view_model/services/session/session_services.dart';
import 'package:chatterbox/features/auth/view_model/services/storage/local_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class AuthProvider with ChangeNotifier {
  AuthProvider();

  bool _loginLoading = false;
  bool get loginLoading => _loginLoading;

  setAuthLoading(bool value) {
    _loginLoading = value;
    notifyListeners();
  }

  String _email = '';
  String get email => _email;
  String _password = '';
  String get password => _password;

  setEmail(String email) {
    _email = email;
  }

  setPassword(String password) {
    _password = password;
  }

  resetFields() {
    _email = '';
    _password = '';
    notifyListeners();
  }

  Future<bool> clearSession({required String message}) {
    LocalStorage localStorage = LocalStorage();
    Utils.toastMessage(message);
    return localStorage.clearValue('isLogin');
  }

  Future<void> loginApi(BuildContext context) async {
    try {
      setAuthLoading(true);

      var response =
          await _loginApiCall({'email': _email, "password": _password});

      if (response != null) {
        await SessionController().saveUserInPreference(response);
        await SessionController().getUserFromPreference();

        setAuthLoading(false);
        Utils.toastMessage('Login successful');

        resetFields();
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesName.home,
          (Route<dynamic> route) => false,
        );
      } else {
        setAuthLoading(false);
        Utils.snackBar("Invalid login credentials", context);
      }
    } catch (error, stackTrace) {
      setAuthLoading(false);
      if (kDebugMode) {
        print('Error during login: $error');
        print(stackTrace);
      }

      setAuthLoading(false);
      Utils.snackBar(error.toString(), context);
    }
  }

  Future<dynamic> _loginApiCall(dynamic data) async {
    await Future.delayed(const Duration(seconds: 2));
    if (data['email'] == userEmail && data['password'] == userPassword) {
      return UserModel(
          id: 0, name: 'Dev', email: userEmail, password: userPassword);
    } else {
      return null;
    }
  }

  Future<void> logoutApi(BuildContext context) async {
    setAuthLoading(true);
    clearSession(message: 'Sign out').then((value) async {
      setAuthLoading(false);
      Navigator.pushNamedAndRemoveUntil(
        context,
        RoutesName.login,
        (Route<dynamic> route) => false,
      );
    });
  }
}
