// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

class CustomSpacing extends StatelessWidget {
  double? height;
  double? width;
  CustomSpacing({
    super.key,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * (height ?? 0),
      width: MediaQuery.of(context).size.height * (width ?? 0),
    );
  }
}