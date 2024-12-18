import 'package:chatterbox/configs/app_themes/colors.dart';
import 'package:chatterbox/configs/utils/extensions.dart';
import 'package:chatterbox/features/auth/view_model/services/session/session_services.dart';
import 'package:chatterbox/features/home/view/components/custom_alert_dialog.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: context.mediaQueryWidth * 0.7,
      child: SizedBox(
        height: context.mediaQueryHeight,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 150,
                      child: DrawerHeader(
                        decoration: const BoxDecoration(
                          color: AppPellet.primaryColor,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              visualDensity: const VisualDensity(
                                  vertical: -3, horizontal: 1),
                              contentPadding: const EdgeInsets.only(right: 0),
                              leading: const Icon(
                                Icons.person,
                                size: 50,
                                color: AppPellet.whiteBackground,
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    SessionController().user.name!,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    overflow: TextOverflow.ellipsis,
                                    SessionController().user.email!,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      visualDensity:
                          const VisualDensity(vertical: -3, horizontal: 1),
                      leading: const Icon(
                        Icons.dashboard_outlined,
                        size: 20,
                      ),
                      title: const Text(
                        'Dashbord',
                        style: TextStyle(fontSize: 14),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    Divider(
                      color: Colors.grey.shade300,
                    ),
                    ListTile(
                        visualDensity:
                            const VisualDensity(vertical: -3, horizontal: 1),
                        leading: const Icon(
                          Icons.logout,
                          size: 20,
                        ),
                        title: const Text(
                          'Logout',
                          style: TextStyle(fontSize: 14),
                        ),
                        onTap: () {
                          showCustomAlertDialog(
                            onConfirm: () =>
                                context.authProvider.logoutApi(context),
                            context: context,
                            title: 'Logout',
                            action: 'Logout',
                            content: 'Are you sure to logout?',
                          );
                        }),
                  ],
                ),
              ),
            ),
            const Text(
              'Made with ❤️ Sajid',
              style: TextStyle(fontSize: 8),
            ),
            20.height,
          ],
        ),
      ),
    );
  }
}
