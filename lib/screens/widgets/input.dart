import "package:try_hive/screens/widgets/custom_spacing.dart";
import "package:try_hive/screens/widgets/space.dart";
import "package:try_hive/screens/widgets/text.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";

class CustomTextInput extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType textInputType;
  final bool? obsecureText;
  final bool? enable;
  final String hintText;
  final String label;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? outterPadding;
  final Iterable<String>? autofillHints;
  final int? maxLines;
  final int? maxLength;
  final double? width;
  final double? height;
  final Widget? prefix;
  final Widget? suffix;
  final Color? hintShade;
  final TextCapitalization? textCapitalization;
  const CustomTextInput({
    super.key, 
    required this.controller, 
    required this.validator, 
    required this.textInputType, 
    required this.hintText, 
    this.obsecureText,
    this.enable,
    this.contentPadding,
    this.autofillHints, 
    this.maxLines, this.maxLength, this.width, this.height, this.suffix, this.prefix, required this.label, this.textCapitalization, this.outterPadding, this.hintShade,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: outterPadding ?? EdgeInsets.symmetric(
        vertical: verticalSpace(context, (height ?? 0))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            text: label, 
            fontSize: 14, 
            textColor: Colors.grey.shade900,
            fontWeight: FontWeight.bold,
          ),
          const CustomSpacing(height: .0075),
          TextFormField(
            controller: controller,
            validator: validator,
            keyboardType: textInputType,
            maxLines: maxLines,
            enabled: enable,
            textCapitalization: textCapitalization ?? TextCapitalization.sentences,
            obscureText: obsecureText ?? false,
            autofillHints: autofillHints,
            inputFormatters: [
              LengthLimitingTextInputFormatter(maxLength)
            ],
            decoration: InputDecoration(
              prefixIcon: prefix,
              fillColor: Colors.grey.shade100,
              filled: true,
              hintText: hintText,
              contentPadding: contentPadding ?? const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              hintStyle: TextStyle(
                color: hintShade ?? Colors.grey.shade600,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12),
              ),
              suffix: suffix,
            ),
          ),
        ],
      ),
    );
  }
}