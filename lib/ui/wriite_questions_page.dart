import 'package:flutter/material.dart';
import 'package:nfc_tool/model/form.dart';
import 'package:nfc_tool/util/enum.dart';
import 'package:nfc_tool/util/validator.dart';
import 'package:nfc_tool/widgets/custom_textfield.dart';
import 'package:nfc_tool/widgets/secondary_button.dart';

class WriteQuestionsPage extends StatefulWidget {
  const WriteQuestionsPage({Key? key}) : super(key: key);

  @override
  _WriteQuestionsPageState createState() => _WriteQuestionsPageState();
}

class _WriteQuestionsPageState extends State<WriteQuestionsPage>
    with Validator {
  late List<Map<String, dynamic>> data;
  late List<Question> questions;

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
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => WriteQuestionsPage(),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Write'),
      ),
      body: ListView.builder(
        itemCount: questions.length + 1,
        itemBuilder: (context, index) {
          if (index == questions.length) {
            return SecondaryButton(
                text: 'Next', onPressed: () => onNextButtonPressed(context));
          }
          return Column(
            children: [
              Text(questions[index].question),
              RadioListTile<YesOrNo>(
                title: const Text('Yes'),
                value: YesOrNo.yes,
                groupValue: questions[index].yesOrNo,
                onChanged: (YesOrNo? value) {
                  setState(() {
                    questions[index].yesOrNo = value!;
                  });
                },
              ),
              questions[index].specify != null
                  ? CustomTextfield(
                      text: '',
                      controller: specifyController,
                      validator: textValidation,
                    )
                  : SizedBox(),
              RadioListTile<YesOrNo>(
                title: const Text('No'),
                value: YesOrNo.no,
                groupValue: questions[index].yesOrNo,
                onChanged: (YesOrNo? value) {
                  setState(() {
                    questions[index].yesOrNo = value; 
                  });
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
