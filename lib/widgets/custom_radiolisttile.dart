import 'package:flutter/material.dart';

class CustomRadioListTile extends StatelessWidget {
  const CustomRadioListTile({
    required title,
    required value,
    required groupValue,
    required onChanged,
  })  : _title = title,
        _value = value,
        _groupValue = groupValue,
        _onChanged = onChanged;

  final String _title;
  final dynamic _value;
  final dynamic _groupValue;
  final Function(dynamic)? _onChanged;

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      tileColor:  Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      title: Text(
        _title,
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(fontSize: 11.0, fontFamily: 'Arial'),
      ),
      value: _value,
      groupValue: _groupValue,
      onChanged: _onChanged,
    );
  }
}
