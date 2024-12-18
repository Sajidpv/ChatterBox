import 'dart:io';
import 'package:chatterbox/features/home/view/components/custom_alert_dialog.dart';
import 'package:flutter/material.dart';

class WillPopScopWidget extends StatelessWidget {
  const WillPopScopWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          if (didPop) {
            return;
          }
          showCustomAlertDialog(
              context: context,
              title: 'Are you sure?',
              action: 'Leave',
              backAction: 'Stay',
              content: 'Are you sure you want to leave this app?',
              onConfirm: () {
                exit(0);
              });
        },
        child: child);
  }
}
