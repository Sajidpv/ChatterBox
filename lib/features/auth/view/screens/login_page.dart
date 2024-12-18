import 'package:chatterbox/configs/utils/extensions.dart';
import 'package:chatterbox/features/auth/view/widgets/email_field_widget.dart';
import 'package:chatterbox/features/auth/view/widgets/login_button_widget.dart';
import 'package:chatterbox/features/auth/view/widgets/password_field_widget.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
                40.height,
                Image.asset(
                  'assets/images/logins.png',
                  height: 300,
                ),
                30.height,
                InputEmailWidget(
                    focusNode: emailFocusNode,
                    passwordFocusNode: passwordFocusNode),
                (context.mediaQueryHeight * .02).height,
                InputPasswordWidget(),
                60.height,
                const SizedBox(
                    width: double.infinity, child: LoginButtonWidget()),
                (context.mediaQueryHeight * .05).height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
