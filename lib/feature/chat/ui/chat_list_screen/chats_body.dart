import 'package:flutter/material.dart';

import '../../model/chats.dart';
import '../chat_message_screen/chat_message_screen.dart';
import 'chats_card.dart';

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
         
          Expanded(
            child: ListView.builder(
              itemCount: listOfChats.length,
              itemBuilder: (context, index) => ChatsCard(
                chat: listOfChats[index],
                press: () {
                  var product;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatMessageScreen(
                                            reciverID: product['userId'],
                                            reciverName: product['userName'],

                          )));
                }, 
              ),
            ),
          ),
        ],
      ),
    );
  }
}
