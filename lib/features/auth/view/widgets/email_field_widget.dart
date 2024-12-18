import 'package:chatterbox/features/auth/view_model/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InputEmailWidget extends StatelessWidget {
  final FocusNode? focusNode, passwordFocusNode;
  const InputEmailWidget({super.key, this.focusNode, this.passwordFocusNode});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, child) {
      return TextFormField(
        keyboardType: TextInputType.emailAddress,
        focusNode: focusNode,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
            hintText: 'Email',
            labelText: 'Email',
            prefixIcon: const Icon(Icons.alternate_email)),
        onChanged: (value) {
          provider.setEmail(value);
        },
      );
    });
  }
}
