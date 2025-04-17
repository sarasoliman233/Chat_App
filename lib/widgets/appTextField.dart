import 'package:flutter/material.dart';

import '../constants.dart';

class AppTextFormField extends StatelessWidget {
   AppTextFormField({super.key,this.hintText,this.onChanged, this.errorMessage,this.obscureText=false});
String? hintText;
Function(String)? onChanged;
   final String? errorMessage;
   bool obscureText ;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      obscureText:obscureText ,
      validator: (data){
        if(data!.isEmpty){
        return errorMessage;
        }
      },
      onChanged: onChanged,
      style: TextStyle(
        fontSize: 16,
        fontFamily: 'caros',
        fontWeight: FontWeight.w400
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 13.0),
        hintText: hintText,
          hintStyle: TextStyle(
            color: Color(0xFF797C7B),
            fontSize: 16,
            fontFamily: 'caros',
            fontWeight: FontWeight.w300
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: BorderSide(
                  width: 1.4,
                  color: kPrimaryColor,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: BorderSide(
                  width: 1.4,
                  color: kPrimaryColor,
              )),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: BorderSide(
                  color: Colors.white
              )

          )
      ),
    );
  }
}
