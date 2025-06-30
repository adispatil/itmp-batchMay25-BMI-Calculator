import 'package:flutter/material.dart';

class SectionLabelWidget extends StatelessWidget {
  const SectionLabelWidget({
    super.key,
    required this.sectionLabel,
    this.textColor,
  });

  final String sectionLabel;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      sectionLabel,
      style: TextStyle(
        color: textColor ?? Color(0xFF8F9099),
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
