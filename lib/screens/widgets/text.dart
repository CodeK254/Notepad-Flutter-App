import "package:flutter/material.dart";

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight? fontWeight;
  final Color textColor;
  final Color? backgroundColor;
  final bool? centerText;
  final TextDecoration? textDecoration;
  final String? fontFamily;
  final TextOverflow? textOverflow;
  const CustomText({
    super.key, required this.text, required this.fontSize, this.fontWeight, required this.textColor, this.backgroundColor, this.centerText, this.textDecoration, this.fontFamily, this.textOverflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: textColor,
        fontWeight: fontWeight ?? FontWeight.normal,
        backgroundColor: backgroundColor ?? Colors.transparent,
        decoration: textDecoration ?? TextDecoration.none,
        fontFamily: fontFamily,
      ),
      textAlign: centerText == true ? TextAlign.center : TextAlign.left,
      overflow: textOverflow ?? TextOverflow.visible,
    );
  }
}