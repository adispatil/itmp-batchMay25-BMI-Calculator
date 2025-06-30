import 'package:flutter/material.dart';

class ValueWidget extends StatelessWidget {
  const ValueWidget({super.key, required this.value});

  final String value;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: TextStyle(
        fontSize: 45.0,
        color: Colors.white,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}
