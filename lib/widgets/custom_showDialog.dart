import 'package:flutter/material.dart';

class CustomShowDialog {
  CustomShowDialog({required title, required imageAsset, required description})
      : _title = title,
        _imageAsset = imageAsset,
        _description = description;

  final String _title;
  final String _imageAsset;
  final String _description;
  void showCustomDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      barrierColor: const Color(0xFF999999),
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(_title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Image.asset(
                  _imageAsset,
                  fit: BoxFit.none,
                  scale: 2.0,
                ),
                Text(_description),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Back to Home'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
