import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../model/chat_mesage.dart';

class MessageText extends StatelessWidget {
   MessageText({required this.message, super.key, });
  final ChatMessage message;
  final  user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
                Text(
                 '',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                )
             
                ,
          Text(
            message.text,
            style: TextStyle(
                color: message.isSender ? Colors.white : Colors.black),
          )
        ],
      ),
    );
  }
}
