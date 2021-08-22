import 'package:flutter/material.dart';
import 'package:nfc_tool/model/form.dart';
import 'package:nfc_tool/ui/write_symptoms_page.dart';
import 'package:nfc_tool/util/validator.dart';
import 'package:nfc_tool/widgets/custom_textfield.dart';
import 'package:nfc_tool/widgets/secondary_button.dart';

class WriteDetailsPage extends StatefulWidget with Validator {
  const WriteDetailsPage({Key? key}) : super(key: key);

  @override
  _WriteDetailsPageState createState() => _WriteDetailsPageState();
}

void onNextButtonPressed(
    GlobalKey<FormState> key, BuildContext context, Details details) {
  if (key.currentState!.validate()) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => WriteSymptomsPage(
        details: details,
      ),
    ),
  );
  }
  print('validation error');
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
      backgroundColor: Color(0xFFF2F2F2),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Write'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            CustomTextfield(
              validator: widget.textValidation,
              controller: _fullnameController,
              text: 'Full Name',
            ),
            SizedBox(height: 8.0,),
            CustomTextfield(
              validator: widget.textValidation,
              controller: _collegeController,
              text: 'College',
            ),
            SizedBox(height: 8.0,),
            CustomTextfield(
              validator: widget.textValidation,
              controller: _cysController,
              text: 'CYS',
            ),
            SizedBox(height: 8.0,),
            CustomTextfield(
              validator: widget.textValidation,
              controller: _addressController,
              text: 'Address',
            ),
            SizedBox(height: 8.0,),
            CustomTextfield(
              validator: widget.mobileValidation,
              controller: _mobileController,
              text: 'Mobile Phone Number',
            ),
            SizedBox(height: 8.0,),
            CustomTextfield(
              validator: widget.emailValidation,
              controller: _emailController,
              text: 'E-mail Address',
            ),
            SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SecondaryButton(
                backroudColor: Theme.of(context).primaryColor,
                text: 'Next',
                onPressed: () => onNextButtonPressed(
                  _formKey,
                  context,
                  Details(
                    fullname: _fullnameController.text,
                    college: _collegeController.text,
                    cys: _cysController.text,
                    address: _addressController.text,
                    mobile: _mobileController.text,
                    email: _emailController.text,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
