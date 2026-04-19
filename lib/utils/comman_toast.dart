import 'package:flutter/material.dart';

commanToast(BuildContext context ,String message,{Color? bgColor}){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message),backgroundColor:bgColor?? Colors.red,));
}
