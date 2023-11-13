import 'package:flutter/material.dart';
import 'package:syoftassignment/core/constants/text_style_constants.dart';

class TextWithUnderline extends StatelessWidget {
  const TextWithUnderline({
    super.key,
    required this.text,
    required this.isActive,
  });
  final bool isActive;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 6),
      decoration: isActive
          ? const BoxDecoration(
              border: Border(bottom: BorderSide()),
            )
          : null,
      child: Text(text,
          style: isActive
              ? TextStyleConstants.s15WBcBlack
              : TextStyleConstants.s15WNcBlack40),
    );
  }
}
