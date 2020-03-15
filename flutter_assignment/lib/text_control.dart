import 'package:flutter/material.dart';
import 'package:flutter_assignment/action_button.dart';

import './suggestion.dart';
import './action_button.dart';

class TextControl extends StatelessWidget {
  final Function textChanger;
  final String text;

  TextControl(this.textChanger, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Suggestion(text),
          ActionButton(textChanger)
        ],
      ),
    );
  }
}
