import 'package:flutter/material.dart';
import 'package:nfc_tool/model/form.dart';
import 'package:nfc_tool/ui/agreement_page.dart';
import 'package:nfc_tool/util/enum.dart';
import 'package:nfc_tool/util/validator.dart';
import 'package:nfc_tool/widgets/custom_radiolisttile.dart';
import 'package:nfc_tool/widgets/custom_textfield.dart';
import 'package:nfc_tool/widgets/secondary_button.dart';

class WriteQuestionsPage extends StatefulWidget {
  const WriteQuestionsPage({required details, required symptoms})
      : _details = details,
        _symptoms = symptoms;

  final Details _details;
  final List<Symptom> _symptoms;

  @override
  _WriteQuestionsPageState createState() => _WriteQuestionsPageState();
}

class _WriteQuestionsPageState extends State<WriteQuestionsPage>
    with Validator {
  late List<Map<String, dynamic>> data;
  late List<Question> questions;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController specifyController;

  @override
  void initState() {
    data = [
      {
        'question':
            'Have you had face-to-face contact with a probable or confirmed COVID-19 case within 1 meter and for more than 15 minutes for the past 14 days?',
      },
      {
        'question':
            'Have you provided direct care for a patient without using proper “Personal Protective Equipment (PPE)” for the part 14 days?',
      },
      {
        'question':
            'Have you travelled outside the Philippines in the past 14 days?',
      },
      {
        'question':
            'Have you travelled outside the current city/municipality where you reside? If yes, specify which city/municipality you went to',
        'specify': '',
      }
    ];
    questions = data.map(
      (e) {
        if (e.containsKey('specify')) {
          return Question.withSpecify(
              question: e['question'], specify: e['specify']);
        }
        return Question(
          question: e['question'],
        );
      },
    ).toList();
    specifyController = TextEditingController();
    super.initState();
  }

  void onNextButtonPressed(BuildContext context) {
    bool validate = true;
    questions.forEach((element) {
      if (element.yesOrNo == null) {
        validate = false;
      }
    });
    if (validate) {
      if (_formKey.currentState!.validate()) {
        print('next');
        questions.forEach((Question element) {
          if (element.specify != null) {
            if (specifyController.text == '') {
              element.specify = '';
            }
          }
        });
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AgreementPage(
              details: widget._details,
              symptoms: widget._symptoms,
              questions: questions,
            ),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('you need to answer all questions'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Write'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: questions.length + 1,
        itemBuilder: (context, index) {
          if (index == questions.length) {
            return SecondaryButton(
                text: 'Next', onPressed: () => onNextButtonPressed(context));
          }
          return Column(
            children: [
              Text(
                questions[index].question,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: 12.0),
              ),
              SizedBox(
                height: 8.0,
              ),
              CustomRadioListTile(
                title: 'Yes',
                value: YesOrNo.yes,
                groupValue: questions[index].yesOrNo,
                onChanged: (value) {
                  setState(() {
                    questions[index].yesOrNo = value;
                  });
                },
              ),
              questions[index].specify != null
                  ? Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextfield(
                          enabled: questions[index].yesOrNo == YesOrNo.yes
                              ? true
                              : false,
                          text: '',
                          controller: specifyController,
                          onChanged: (value) {
                            print(value);
                            questions[index].specify = value;
                          },
                          validator: (value) {
                            return textFieldSpecifyValidation(
                                yesOrNo: questions[index].yesOrNo, text: value);
                          },
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 8.0,
                    ),
              CustomRadioListTile(
                title: 'No',
                value: YesOrNo.no,
                groupValue: questions[index].yesOrNo,
                onChanged: (value) {
                  setState(() {
                    specifyController.text = '';
                    questions[index].yesOrNo = value;
                  });
                },
              ),
              SizedBox(
                height: 16.0,
              ),
            ],
          );
        },
      ),
    );
  }
}
