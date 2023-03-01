import 'package:flutter/material.dart';

import '../constants.dart';

class MessageBubble extends StatelessWidget {
  final String? message, sender;
  final bool? isMe;
  const MessageBubble({Key? key, this.message, this.sender, this.isMe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(bubbleRadius),
          topRight: Radius.circular(bubbleRadius),
          bottomLeft: Radius.circular(bubbleRadius),
          bottomRight: Radius.circular(bubbleRadius),
        ),
        color: isMe! ? kSendButtonColor : kSenderBoxColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            children: [
              Text(
                sender!,
                style: TextStyle(fontSize: 12, color: kChatEmailColor),
              ),
              SizedBox(height: 8),
              Text(
                message!,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}