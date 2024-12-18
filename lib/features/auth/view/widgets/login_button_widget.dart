import 'package:chatterbox/configs/utils/utils.dart';
import 'package:chatterbox/configs/validator/input_validator.dart';
import 'package:chatterbox/features/auth/view/components/rounded_button.dart';
import 'package:chatterbox/features/auth/view_model/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, child) {
      return RoundButton(
        title: 'Login',
        loading: provider.loginLoading ? true : false,
        onPress: provider.loginLoading
            ? () {}
            : () {
                if (provider.email.isEmpty) {
                  Utils.snackBar('Please enter email', context);
                } else if (!AppValidator.emailValidator(
                    provider.email.toString())) {
                  Utils.snackBar('Please enter valid email', context);
                } else if (provider.password.isEmpty ||
                    provider.password == '') {
                  Utils.snackBar('Please enter password', context);
                } else if (provider.password.length < 6) {
                  Utils.snackBar('Please enter 6 digit password', context);
                } else {
                  provider.loginApi(context);
                }
              },
      );
    });
  }
}
