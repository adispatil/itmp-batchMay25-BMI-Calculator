import 'package:flutter/material.dart';

class SectionLabelWidget extends StatelessWidget {
  const SectionLabelWidget({
    super.key,
    required this.sectionHeader,
    this.textColor,
  });

  final String sectionHeader;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      sectionHeader,
      style: TextStyle(
        color: textColor ?? Color(0xFF8F9099),
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
