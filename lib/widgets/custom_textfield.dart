import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield(
      {required text, required controller, required validator})
      : _text = text,
        _controller = controller,
        _validator = validator;
  final String _text;
  final TextEditingController _controller;
  final String? Function(String?) _validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(_text),
        TextFormField(
          controller: _controller,
          validator: _validator,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
