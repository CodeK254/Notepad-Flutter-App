import "package:flutter/material.dart";

class CustomLabelText extends StatelessWidget {
  final String black;
  final String indigo;
  const CustomLabelText({
    super.key, required this.black, required this.indigo,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: black,
            style: const TextStyle(
              fontSize: 23,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: indigo,
            style: TextStyle(
              fontSize: 23,
              color: Colors.indigo.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}