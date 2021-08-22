import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  SecondaryButton(
      {@required onPressed,
      @required text,
      backroudColor = const Color(0xFF44546A),
      fontColor = Colors.white})
      : _onPressed = onPressed,
        _text = text,
        _backgroundColor = backroudColor,
        _fontColor = fontColor;

  final VoidCallback? _onPressed;
  final String _text;
  final Color _backgroundColor;
  final Color _fontColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: _backgroundColor,
        ),
        onPressed: _onPressed,
        child: Text(
          _text,
          style: Theme.of(context).textTheme.subtitle2!.copyWith(
              color: _fontColor,
              fontFamily: 'Arial',
              fontSize: 12,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
