import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final Function textChanger;

  ActionButton(this.textChanger);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text('Tap me!'),
        onPressed: textChanger,
      ),
    );
  }
}
