import 'package:chatterbox/features/home/model/message_model.dart';

List<ChatMessage> demeChatMessages = [
  ChatMessage(
    text: "Hi Michael Knite,",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: false,
    time: DateTime.now().subtract(const Duration(hours: 1)),
  ),
  ChatMessage(
    text: "Hello, How are you?",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: true,
    time: DateTime.now().subtract(const Duration(minutes: 30)),
  ),
  ChatMessage(
    text: "",
    messageType: ChatMessageType.audio,
    messageStatus: MessageStatus.viewed,
    isExpanded: true,
    transcript:
        'Wanted to place an order for a new items. Here what i need. Want 50 Units of classic leather wallet n black. Next, 30 units of the summer floral dress',
    orderList: ['Leather Wallet', 'Floral Dress'],
    isSender: false,
    time: DateTime.now().subtract(const Duration(minutes: 20)),
  ),
  ChatMessage(
    text: "",
    messageType: ChatMessageType.audio,
    messageStatus: MessageStatus.viewed,
    isExpanded: true,
    transcript:
        'Wanted to place an order for a new items. Here what i need. Want 50 Units of classic leather wallet n black. Next, 30 units of the summer floral dress',
    orderList: ['Leather Wallet', 'Floral Dress'],
    isSender: true,
    time: DateTime.now().subtract(const Duration(minutes: 10)),
  ),
  ChatMessage(
    text: "Did you got it?",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.notSent,
    isSender: true,
    time: DateTime.now().subtract(const Duration(minutes: 2)),
  ),
  ChatMessage(
    text: "",
    messageType: ChatMessageType.audio,
    messageStatus: MessageStatus.viewed,
    isExpanded: false,
    transcript:
        'Wanted to place an order for a new items. Here what i need. Want 50 Units of classic leather wallet n black. Next, 30 units of the summer floral dress',
    orderList: ['Leather Wallet', 'Floral Dress'],
    isSender: false,
    time: DateTime.now().subtract(const Duration(minutes: 20)),
  ),
  ChatMessage(
    text: "OK, Got it!",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: false,
    time: DateTime.now().subtract(const Duration(seconds: 1000)),
  ),
  ChatMessage(
    text: "Hope you like it",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.notView,
    isSender: true,
    time: DateTime.now().subtract(const Duration(seconds: 100)),
  ),
];
