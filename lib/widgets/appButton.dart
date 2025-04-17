import 'package:chat_app/widgets/appText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class AppButton extends StatelessWidget {
   AppButton({super.key,required this.text, this.onTap});
String text;
VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: kPrimaryColor,

        ),
        height: 48,
        width: double.infinity,
        child: Center(child: appText(text: text, fontSize: 18, color: Colors.white, fontFamily: 'caros', fontWeight: FontWeight.w600)),
      ),
    );
  }
}
