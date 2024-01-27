import 'package:flutter/material.dart';

showSnackBar({final String? text,final Color? color,required BuildContext context}){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text??''),
  backgroundColor: color,
  ));
}