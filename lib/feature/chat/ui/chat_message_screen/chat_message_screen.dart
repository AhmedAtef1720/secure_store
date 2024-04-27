import 'package:flutter/material.dart';

import 'message_body.dart';
class ChatMessageScreen extends StatefulWidget {
  const ChatMessageScreen({super.key});

  @override
  State<ChatMessageScreen> createState() => _ChatMessageScreenState();
}

class _ChatMessageScreenState extends State<ChatMessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: MessageBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text(
        'friendly chat',
        style: TextStyle(fontSize: 16),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.local_phone),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.videocam),
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.logout),
        ),
      ],
    );
  }
}
