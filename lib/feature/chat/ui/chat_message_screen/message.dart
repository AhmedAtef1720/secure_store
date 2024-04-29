
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:secure_store/core/utils/AppColors.dart';
import 'package:secure_store/feature/screens/profile/userProfile.dart';

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
          return MessageText(message: message, );
        case ChatMessageType.image:
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
                                      backgroundColor: appcolors.whitecolor,
                                      radius: 20,
                                      backgroundImage: (imagePath != null)
                                          ? FileImage(File(imagePath!))
                                              as ImageProvider
                                          : const AssetImage(
                                              'assets/person.png',
                                            )),
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
