import 'package:flutter/material.dart';

class DisplayText extends StatelessWidget {
  final String inputText;

  DisplayText(this.inputText);

  @override
  Widget build(BuildContext context) {
    return Text(inputText);
  }
}
