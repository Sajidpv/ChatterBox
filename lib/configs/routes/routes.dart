import 'package:chatterbox/features/auth/model/user_model.dart';
import 'package:chatterbox/features/auth/view/screens/login_page.dart';
import 'package:chatterbox/features/auth/view/screens/spalsh_screen.dart';
import 'package:chatterbox/features/home/view/screens/chat_home.dart';
import 'package:chatterbox/features/home/view/screens/chat_screen.dart';
import 'package:flutter/material.dart';

import 'route_names.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashView());

      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ChatsScreen());

      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginView());

      case RoutesName.chat:
        final arguments = settings.arguments as UserModel;
        return MaterialPageRoute(
            builder: (BuildContext context) => MessagesScreen(
                  user: arguments,
                ));

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text(RoutesName.no_route),
            ),
          );
        });
    }
  }
}
