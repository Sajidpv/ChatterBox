// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:chatterbox/configs/routes/route_names.dart';
import 'package:chatterbox/features/auth/view_model/services/session/session_services.dart';
import 'package:flutter/material.dart';

class SplashServices {
  void checkAuthentication(BuildContext context) async {
    SessionController().getUserFromPreference().then((value) async {
      if (SessionController().isLogin!) {
        splashNavigation(context, RoutesName.home);
      } else {
        splashNavigation(context, RoutesName.login);
      }
    }).onError((error, stackTrace) {
      splashNavigation(context, RoutesName.login);
    });
  }

  Timer splashNavigation(BuildContext context, String route) {
    return Timer(
      const Duration(seconds: 2),
      () => Navigator.pushNamedAndRemoveUntil(context, route, (route) => false),
    );
  }
}
