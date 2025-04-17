import 'package:chat_app/constants.dart';
import 'package:chat_app/widgets/appText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content:
      Row(
        children: [
          Icon(Icons.info_outline, color: kPrimaryColor),
          SizedBox(width: 8),
          Expanded(
            child:
            appText(text:message, fontSize: 14, color: kPrimaryColor, fontFamily: 'caros', fontWeight: FontWeight.w600),
          ),
        ],
      ),
      backgroundColor: Colors.white, // خلفية بيضاء
      elevation: 6.0, // ارتفاع واضح
      behavior: SnackBarBehavior.floating, // يجعل الـ SnackBar عائمًا
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14), // حواف مستديرة
      ),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12), // هوامش حول الـ SnackBar
      duration: Duration(seconds: 3), // مدة العرض
    ),
  );
}



