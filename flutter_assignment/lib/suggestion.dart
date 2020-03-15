import 'package:flutter/material.dart';

class Suggestion extends StatelessWidget {
  final String text;

  Suggestion(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
