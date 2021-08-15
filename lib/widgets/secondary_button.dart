import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  SecondaryButton({@required onPressed, @required text})
      : _onPressed = onPressed,
        _text = text;

  final VoidCallback _onPressed;
  final String _text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _onPressed,
      child: Text(_text),
    );
  }
}
