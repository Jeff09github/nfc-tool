import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({@required onPressed, @required iconData, @required text})
      : _onPressed = onPressed,
        _iconData = iconData,
        _text = text;

  final VoidCallback _onPressed;
  final String _text;
  final IconData _iconData;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          primary: Theme.of(context).primaryColor,
          backgroundColor: Colors.white),
      onPressed: _onPressed,
      child: Row(
        children: [
          Icon(_iconData),
          SizedBox(width: 8.0,),
          Text(_text),
        ],
      ),
    );
  }
}
