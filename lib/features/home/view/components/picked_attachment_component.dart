import 'dart:io';

import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class PickedAttachmentComponent extends StatelessWidget {
  final File? pickedFile;

  const PickedAttachmentComponent({
    super.key,
    this.pickedFile,
  });

  @override
  Widget build(BuildContext context) {
    if (pickedFile == null) {
      return const SizedBox();
    }

    return InkWell(
      onTap: () async {
        await OpenFile.open(pickedFile?.path);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            padding: const EdgeInsets.all(1.0),
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
            ),
            child: _buildFilePreview(),
          ),
        ),
      ),
    );
  }

  Widget _buildFilePreview() {
    final String filePath = pickedFile!.path;
    if (filePath.endsWith(".jpg") ||
        filePath.endsWith(".jpeg") ||
        filePath.endsWith(".png")) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(04),
        child: Image.file(
          pickedFile!,
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),
      );
    } else {
      return const Icon(
        Icons.insert_drive_file,
        color: Colors.white,
        size: 30,
      );
    }
  }
}
