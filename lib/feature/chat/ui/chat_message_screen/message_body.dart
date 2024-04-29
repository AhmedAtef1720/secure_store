import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import '../../model/chat_mesage.dart';
import 'chat_input_field.dart';
import 'message.dart';

class MessageBody extends StatefulWidget {
  const MessageBody({super.key, required this.reciverID, required this.reciverEmail});
  final String reciverID;
  final String reciverEmail;

  @override
  State<MessageBody> createState() => _MessageBodyState();
}

class _MessageBodyState extends State<MessageBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: StreamBuilder<QuerySnapshot<Map>>(
            stream: FirebaseFirestore.instance
                .collection('messages')
                .orderBy('time', descending: false)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.data!.size <= 0) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final snapShotData = snapshot.data;
              final snapShotDataSize = snapShotData!.size;
              List<ChatMessage> chatMessages = [];
              final User = FirebaseAuth.instance.currentUser!;
              for (var element in snapshot.data!.docs) {
                final data = element.data();
                ChatMessageType type;
                ChatMessage message;
                final senderId = data['senderId'];
                if (data['type'] == 1) {
                  type = ChatMessageType.image;
                  message = ChatMessage(
                    messageType: type,
                    messageStatus: MessageStatus.viewed,
                    isSender: User.uid == senderId,
                    senderImage: data['senderImage'],
                    sender: data['senderName'],
                    imageUrl: data['image'],
                  );
                } else {
                  type = ChatMessageType.text;
                  message = ChatMessage(
                    messageType: type,
                    messageStatus: MessageStatus.viewed,
                    isSender: User.uid == senderId,
                    senderImage: data['senderImage'],
                    sender: data['senderName'],
                    text: data['message'],
                  );
                }
                chatMessages.add(message);
              }
              return ListView.builder(
                  itemCount: chatMessages.length,
                  itemBuilder: (context, index) => Message(
                      message: chatMessages[index], index: index));
            },
          )),
        ),
         ChatInputField(reciverID:widget.reciverID),
      ],
    );
  }
}
