import 'dart:ui';

import 'package:chatterbox/features/home/model/message_model.dart';
import 'package:chatterbox/features/home/view/components/audio_message_component.dart';
import 'package:flutter/material.dart';

void showAudioMessageDialog(BuildContext context, ChatMessage message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Dialog(
          backgroundColor: Colors.transparent,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 290,
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: AudioMessage(message: message),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.replay, size: 20),
                          title: const Text(
                            'Quick Reorder',
                            style: TextStyle(fontSize: 12),
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(Icons.assignment_ind, size: 20),
                          title: const Text('Assign to Salesmen',
                              style: TextStyle(fontSize: 12)),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(Icons.share, size: 20),
                          title: const Text('Share',
                              style: TextStyle(fontSize: 12)),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.upload,
                            size: 20,
                          ),
                          title: const Text('Export',
                              style: TextStyle(fontSize: 12)),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
