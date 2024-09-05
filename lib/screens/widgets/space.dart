import 'package:flutter/material.dart';

double verticalSpace(BuildContext context, double height){
  return MediaQuery.of(context).size.height * height;
}

double horizontalSpace(BuildContext context, double width){
  return MediaQuery.of(context).size.width * width;
}