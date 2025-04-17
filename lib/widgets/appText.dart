import 'package:flutter/cupertino.dart';

class appText extends StatelessWidget {
  const appText({super.key,required this.text,required this.fontSize,required this.color, this.overflow, required this.fontFamily, required this.fontWeight, this.fontStyle, this.textAlign});
  final String text;
  final double fontSize;
  final Color color;
  final TextOverflow? overflow;
  final String fontFamily;
  final FontWeight fontWeight;
  final FontStyle? fontStyle;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(

        fontSize: fontSize,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        color: color,

      ),
      textAlign: textAlign,
    );
  }
}
