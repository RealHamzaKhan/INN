import 'package:flutter/material.dart';

Text customText({final String? text,final Color? color,final FontWeight? fw,final double? size,
final TextAlign? textAlign,final TextDirection? textDirection}){
  return Text(
    text!,
    style: appStyle(color: color,fw: fw,size: size),
    textAlign: textAlign,
    textDirection: textDirection,
  );
}
TextStyle appStyle({final Color? color,final FontWeight? fw,final double? size}){
  return TextStyle(
      color: color,
      fontWeight: fw,
      fontSize: size,
      fontFamily: 'Poppins',
  );
}