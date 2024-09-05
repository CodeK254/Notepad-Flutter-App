import 'package:try_hive/screens/widgets/custom_spacing.dart';
import 'package:try_hive/screens/widgets/space.dart';
import 'package:flutter/material.dart';

class CustomLabelAndDivider extends StatelessWidget {
  final String label;
  final Color? textColor;
  final bool? extendedDivider;
  const CustomLabelAndDivider({
    super.key, required this.label, this.textColor, this.extendedDivider = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: textColor ?? Colors.white,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: horizontalSpace(context, .15),
              height: 2,
              color: Colors.green,
            ),
           const CustomSpacing(height: .02),
            Container(
              width: !extendedDivider! ? horizontalSpace(context, .22) : horizontalSpace(context, .75),
              height: 1,
              color: Colors.grey,
            ),
          ],
        ),
      ],
    );
  }
}