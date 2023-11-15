import 'package:flutter/material.dart';

class TextIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final int colorValue;

  const TextIcon(
      {super.key,
      required this.icon,
      required this.text,
      required this.colorValue});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Color(colorValue)),
        const SizedBox(width: 10.0),
        Text(text, style: TextStyle(color: Color(Colors.white.value)))
      ],
    );
  }
}
