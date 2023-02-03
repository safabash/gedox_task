import 'package:flutter/material.dart';

class Button_widget extends StatelessWidget {
  const Button_widget(
      {Key? key,
      this.width = 50,
      this.color = const Color.fromARGB(255, 38, 38, 38),
      this.fontSize = 18,
      required this.text})
      : super(key: key);
  final Color? color;
  final String? text;
  final double? width;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        height: 30,
        width: width,
        child: Center(
          child: Text(
            text!,
            style: TextStyle(
              fontSize: fontSize,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
