import 'package:try_hive/screens/widgets/custom_spacing.dart';
import 'package:try_hive/screens/widgets/space.dart';
import 'package:try_hive/screens/widgets/text.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({super.key, this.onSelected, required this.data, this.label, this.height, this.outterPadding, required this.gender});
  final ValueChanged<String?>? onSelected;
  final List<Object?> data;
  final String? label;
  final double? height;
  final EdgeInsetsGeometry? outterPadding;
  final TextEditingController gender;

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
            text: label ?? "Choose", 
            fontSize: 14, 
            textColor: Colors.grey.shade900,
            fontWeight: FontWeight.bold,
          ),
          const CustomSpacing(height: .0075),
          DropdownMenu<String>(
            onSelected: onSelected,
            controller: gender,
            initialSelection: data.first.toString(),
            // menuHeight: horizontalSpace(context, .5),
            width: horizontalSpace(context, .95),
            inputDecorationTheme: InputDecorationTheme(
              fillColor: Colors.grey.shade100,
              filled: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              hintStyle: const TextStyle(
                color: Colors.grey,
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
            ),
            dropdownMenuEntries: [
              ...List.generate(
                data.length,
                (index) => DropdownMenuEntry<String>(
                  value: data[index].toString(), 
                  label: data[index].toString(),
                  labelWidget: CustomText(
                    text: data[index].toString(), 
                    fontSize: 16, 
                    textColor: Colors.grey.shade900,
                    fontFamily: "Ubuntu",
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}