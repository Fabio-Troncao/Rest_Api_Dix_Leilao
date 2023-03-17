import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.text,
    required this.color,
    required this.foregroundColor,
    required this.onPressed,
    this.width = 160,
    this.heigth = 30,
  });

  final Text text;
  final Color color;
  final Color foregroundColor;
  final Function onPressed;
  final double width;
  final double heigth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0, right: 0, top: 10, bottom: 0),
      child: Center(
        child: SizedBox(
          width: width,
          height: heigth,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                foregroundColor: foregroundColor,
                backgroundColor: color,
                elevation: 0),
            child: text,
            onPressed: () => onPressed(),
          ),
        ),
      ),
    );
  }
}