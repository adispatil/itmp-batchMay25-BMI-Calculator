import 'package:flutter/material.dart';

class PlusMinusButtonWidget extends StatelessWidget {
  const PlusMinusButtonWidget({
    super.key,
    required this.iconData,
    required this.onButtonClicked,
  });

  final IconData iconData;
  final VoidCallback onButtonClicked;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onButtonClicked();
      },
      child: Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFF4C4F5E),
        ),
        child: Icon(iconData, color: Colors.white, size: 40),
      ),
    );
  }
}
