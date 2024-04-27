import 'package:flutter/material.dart';
import 'package:secure_store/feature/chat/model/chats.dart';

class ChatsCard extends StatelessWidget {
  const ChatsCard({required this.chat, required this.press, super.key});
  final Chat chat;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(chat.image),
                ),
                if (chat.isActive)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                          border: Border.all(color: Colors.white, width: 3)),
                    ),
                  )
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chat.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black),
                ),
                Text(
                  chat.lastMessage,
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
            Spacer(),
            Text(
              chat.time,
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
