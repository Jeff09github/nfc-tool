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
  TextEditingController _collegeController = TextEditingController();
  TextEditingController _cysController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

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
            CustomTextfield(
              validator: widget.textValidation,
              controller: _collegeController,
              text: 'College',
            ),
            CustomTextfield(
              validator: widget.textValidation,
              controller: _cysController,
              text: 'CYS',
            ),
            CustomTextfield(
              validator: widget.textValidation,
              controller: _addressController,
              text: 'Address',
            ),
            CustomTextfield(
              validator: widget.mobileValidation,
              controller: _mobileController,
              text: 'Mobile Phone Number',
            ),
            CustomTextfield(
              validator: widget.emailValidation,
              controller: _emailController,
              text: 'E-mail Address',
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
