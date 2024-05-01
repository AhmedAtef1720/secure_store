import 'package:flutter/material.dart';

import '../../model/chat_mesage.dart';

class MessageImage extends StatelessWidget {
  const MessageImage({required this.index, super.key, this.image});
  final ChatMessage? image;
  final int index;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            child: Image.network(
              image!.imagepath,
              fit: BoxFit.fitWidth,
            ),
          )
        ],
      ),
    );
  }
}
