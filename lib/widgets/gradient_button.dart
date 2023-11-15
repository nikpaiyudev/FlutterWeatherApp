import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final double width;
  final double height;
  final String buttonText;
  final Function onPressed;

  const GradientButton(
      {Key? key,
      required this.width,
      required this.height,
      required this.buttonText,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF019DD3), Colors.blue])),
      child: TextButton(
          onPressed: () => onPressed(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_pin, color: Color(Colors.white.value)),
              const SizedBox(width: 5.0),
              Text(buttonText,
                  style: TextStyle(
                      color: Color(Colors.white.value), fontSize: 18.0)),
            ],
          )),
    );
  }
}
