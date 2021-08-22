import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({
    @required onPressed,
    @required iconData,
    @required text,
    fontColor = const Color(0xFF44546A),
    backgroundColor =  Colors.white,
    @required textstyle,
  })  : _onPressed = onPressed,
        _iconData = iconData,
        _fontColor = fontColor,
        _backgroundColor = backgroundColor,
        _textstyle = textstyle,
        _text = text;

  final VoidCallback _onPressed;
  final String _text;
  final IconData _iconData;
  final Color _fontColor;
  final Color _backgroundColor;
  final TextStyle _textstyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: _fontColor,
          backgroundColor:_backgroundColor,
        ),
        onPressed: _onPressed,
        child: Row(
          children: [
            Icon(
              _iconData,
              size: 60.0,
              color: _fontColor,
            ),
            SizedBox(
              width: 24.0,
            ),
            Text(
              _text,
              style: _textstyle,
            ),
          ],
        ),
      ),
    );
  }
}
