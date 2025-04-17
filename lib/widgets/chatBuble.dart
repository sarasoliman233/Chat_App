import 'package:chat_app/models/messageModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'appText.dart';

class chatBuble extends StatelessWidget {
  const chatBuble({super.key, required this.message});
final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.only(left: 16,top: 16,bottom: 16,right: 32),
        margin: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
            color: kPrimaryColor
        ),
        child: appText(text: message.message, fontSize: 16, color: Colors.white, fontFamily: 'circular', fontWeight: FontWeight.w300),
      ),
    );
  }
}


class chatBubleForFriend extends StatelessWidget {
  const chatBubleForFriend({super.key, required this.message});
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(left: 16,top: 16,bottom: 16,right: 32),
        margin: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            color: Color(0xF7656565)
        ),
        child: appText(text: message.message, fontSize: 16, color: Colors.white, fontFamily: 'circular', fontWeight: FontWeight.w300),
      ),
    );
  }
}
