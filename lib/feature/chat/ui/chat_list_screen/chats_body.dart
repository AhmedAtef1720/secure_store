import 'package:flutter/material.dart';

import '../../model/chats.dart';
import '../chat_message_screen/chat_message_screen.dart';
import 'chats_card.dart';
import 'filled_outline_button.dart';

class ChatsBody extends StatefulWidget {
  const ChatsBody({super.key});

  @override
  State<ChatsBody> createState() => _ChatsBodyState();
}

class _ChatsBodyState extends State<ChatsBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            color: Colors.green,
            child: Row(
              children: [
                FilledOutlineButton(
                  text: 'recent message',
                  press: () {},
                  isFilled: true,
                ),
                SizedBox(
                  width: 20,
                ),
                FilledOutlineButton(
                  text: 'active',
                  press: () {},
                  isFilled: true,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listOfChats.length,
              itemBuilder: (context, index) => ChatsCard(
                chat: listOfChats[index],
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatMessageScreen()));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
