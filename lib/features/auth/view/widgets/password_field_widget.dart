import 'package:chatterbox/configs/app_themes/colors.dart';
import 'package:chatterbox/features/auth/view_model/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InputPasswordWidget extends StatelessWidget {
  InputPasswordWidget({
    super.key,
  });

  final ValueNotifier<bool> _obSecurePassword = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, child) {
      return ValueListenableBuilder(
          valueListenable: _obSecurePassword,
          builder: (context, value, child) {
            return TextFormField(
              obscureText: _obSecurePassword.value,
              obscuringCharacter: "*",
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                hintText: 'Enter password',
                labelText: 'Password',
                hintStyle: const TextStyle(color: AppPellet.borderGrey),
                prefixIcon: const Icon(Icons.lock_open_rounded),
                suffixIcon: InkWell(
                    onTap: () {
                      _obSecurePassword.value = !_obSecurePassword.value;
                    },
                    child: Icon(_obSecurePassword.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility)),
              ),
              onChanged: (value) {
                provider.setPassword(value);
              },
            );
          });
    });
  }
}
