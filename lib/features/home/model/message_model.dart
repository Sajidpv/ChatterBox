enum ChatMessageType { text, audio, image }

enum MessageStatus { notSent, notView, viewed }

class ChatMessage {
  final String text;
  final ChatMessageType messageType;
  final MessageStatus messageStatus;
  final bool isExpanded;
  final String transcript;
  final List<String> orderList;
  final bool isSender;
  final DateTime time;

  ChatMessage({
    this.isExpanded = false,
    this.transcript = '',
    this.orderList = const [],
    required this.time,
    this.text = '',
    required this.messageType,
    required this.messageStatus,
    required this.isSender,
  });
}
