import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    text,
    required controller,
    required validator,
    enabled = true,
    onChanged,
  })  : _text = text,
        _controller = controller,
        _enabled = enabled,
        _onChanged = onChanged,
        _validator = validator;
  final String _text;
  final TextEditingController _controller;
  final String? Function(String?) _validator;
  final Function(String)? _onChanged;
  final bool _enabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (_text != '') ...[
          Text(
            _text,
            style:
                Theme.of(context).textTheme.headline6!.copyWith(fontSize: 15.0),
          ),
          SizedBox(
            height: 2.0,
          ),
        ],
        TextFormField(
          controller: _controller,
          validator: _validator,
          enabled: _enabled,
          onChanged: _onChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(),
          ),
        ),
        // SizedBox(
        //   height: 8.0,
        // ),
      ],
    );
  }
}
