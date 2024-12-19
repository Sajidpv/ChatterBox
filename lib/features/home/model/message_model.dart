enum ChatMessageType { text, audio, image }

enum MessageStatus { notSent, notView, viewed }

class ChatMessage {
  final String text;
  final ChatMessageType messageType;
  final MessageStatus messageStatus;
  final bool isSender;
  final DateTime time;

  ChatMessage({
    required this.time,
    this.text = '',
    required this.messageType,
    required this.messageStatus,
    required this.isSender,
  });
}
