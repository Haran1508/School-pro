import 'package:flutter/cupertino.dart';
import 'package:greenma_info_school/screens/live_chat.dart';

class ChatMessage {
  String message;
  String image;
  MessageType type;
  ChatMessage(
      {@required this.message, @required this.type, @required this.image});
}
