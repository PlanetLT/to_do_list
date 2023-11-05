import 'package:flutter/material.dart';

class TDText extends StatefulWidget {
  late final Color color;
  late final String text;
  late final double fontSize;
  late final bool isBold;
  late final TextAlign textAlign;
  TDText(
      {super.key,
      required this.color,
      required this.text,
      required this.fontSize,
      required this.isBold,
      required this.textAlign});

  @override
  State<TDText> createState() => _TDTextState();
}

class _TDTextState extends State<TDText> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.text,
        style: TextStyle(
          color: widget.color,
          fontWeight: widget.isBold ? FontWeight.bold : FontWeight.normal,
          fontSize: widget.fontSize,
        ),
        textAlign: widget.textAlign);
  }
}
