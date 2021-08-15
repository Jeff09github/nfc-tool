import 'package:flutter/material.dart';
import 'package:nfc_tool/util/validator.dart';
import 'package:nfc_tool/widgets/custom_textfield.dart';
import 'package:nfc_tool/widgets/secondary_button.dart';

class WriteDetailsPage extends StatefulWidget with Validator {
  const WriteDetailsPage({Key? key}) : super(key: key);

  @override
  _WriteDetailsPageState createState() => _WriteDetailsPageState();
}

void onNextButtonPressed(GlobalKey<FormState> key) {
  if (key.currentState!.validate()) {
    print('success');
  }
  print('error');
}

class _WriteDetailsPageState extends State<WriteDetailsPage> {
  TextEditingController _fullnameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Write'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            CustomTextfield(
              validator: widget.textValidation,
              controller: _fullnameController,
              text: 'Full Name',
            ),
            SecondaryButton(
              text: 'Next',
              onPressed: () => onNextButtonPressed(_formKey),
            ),
          ],
        ),
      ),
    );
  }
}
