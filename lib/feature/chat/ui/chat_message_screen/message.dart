
import 'package:flutter/material.dart';

import '../../model/chat_mesage.dart';
import 'message_image.dart';
import 'message_text.dart';

class Message extends StatelessWidget {
  const Message({required this.message, required this.index, super.key});
  final ChatMessage message;
  final int index;
  @override
  Widget build(BuildContext context) {
    Widget messageContain(ChatMessage message, int index) {
      switch (message.messageType) {
        case ChatMessageType.text:
          return MessageText(message: message);
        case ChatMessageType.text:
          return MessageImage(message: message, index: index);
        default:
          return const SizedBox();
      }
    }

    return Padding(
      padding: const EdgeInsets.only(
        top: 20.0,
      ),
      child: Container(
        child: Row(
          mainAxisAlignment: message.isSender
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            if (!message.isSender) ...[
              CircleAvatar(
                radius: 18,
                child: Image.network('assets/images/user_5.png'),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
            messageContain(message, index),
          ],
        ),
      ),
    );
  }
}
