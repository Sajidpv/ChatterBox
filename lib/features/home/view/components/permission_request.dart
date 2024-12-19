import 'package:chatterbox/configs/utils/utils.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> requestPermissions(context) async {
  PermissionStatus permission = await Permission.mediaLibrary.request();
  if (permission.isDenied) {
    permission = await Permission.mediaLibrary.request();
    if (permission.isPermanentlyDenied) {
      Utils.toastMessage(
        'Permission is permanently denied. Please enable it in the app settings.',
      );
      await openAppSettings();
      return false;
    } else if (permission.isDenied) {
      Utils.snackBar('Permission denied.', context);
      return false;
    } else {
      Utils.snackBar('Permission denied.', context);
      return false;
    }
  } else {
    return true;
  }
}
