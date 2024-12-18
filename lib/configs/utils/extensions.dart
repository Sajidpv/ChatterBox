import 'package:chatterbox/features/auth/view_model/provider/login_provider.dart';
import 'package:chatterbox/features/home/view_model/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

extension MediaQueryValues on BuildContext {
  double get mediaQueryHeight => MediaQuery.sizeOf(this).height;
  double get mediaQueryWidth => MediaQuery.sizeOf(this).width;
}

extension EmptySpace on num {
  SizedBox get height => SizedBox(height: toDouble());
  SizedBox get width => SizedBox(width: toDouble());
}

extension Providers on BuildContext {
  AuthProvider get authProvider =>
      Provider.of<AuthProvider>(this, listen: false);
  HomeProvider get homeProvider =>
      Provider.of<HomeProvider>(this, listen: false);
}
