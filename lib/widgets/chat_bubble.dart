import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/message.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    required this.message,
  });
final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
          padding: EdgeInsets.only(left: 16 , right: 26 ,top: 26 , bottom: 26),
          margin: EdgeInsets.symmetric(horizontal: 16 , vertical: 8),
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(32),
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          child: Text(
            message.message,
            style: TextStyle(
              color: Colors.white,
            ),
          )),
    );
  }
}
class ChatBubbleForFriend extends StatelessWidget {
  const ChatBubbleForFriend({
    required this.message,
  });
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
          padding: EdgeInsets.only(left: 16 , right: 26 ,top: 26 , bottom: 26),
          margin: EdgeInsets.symmetric(horizontal: 16 , vertical: 8),
          decoration: BoxDecoration(
            color: Color(0xff6c9fb3),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32),
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          child: Text(
            message.message,
            style: TextStyle(
              color: Colors.white,
            ),
          )),
    );
  }
}

