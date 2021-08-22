import 'package:flutter/material.dart';
import 'package:nfc_tool/model/form.dart';
import 'package:nfc_tool/ui/wriite_questions_page.dart';
import 'package:nfc_tool/widgets/secondary_button.dart';

class WriteSymptomsPage extends StatefulWidget {
  const WriteSymptomsPage({required details}) : _details = details;

  final Details _details;

  @override
  _WriteSymptomsPageState createState() => _WriteSymptomsPageState();
}

class _WriteSymptomsPageState extends State<WriteSymptomsPage> {
  late List<Map<String, dynamic>> data;
  late List<Symptom> symptoms;

  @override
  void initState() {
    data = [
      {
        'symptom': 'Fever',
        'icon': 'assets/images/1Fever.png',
      },
      {
        'symptom': 'Dry Cough',
        'icon': 'assets/images/2Cough.png',
      },
      {
        'symptom': 'Fatigue',
        'icon': 'assets/images/3Fatigue.png',
      },
      {
        'symptom': 'Aces and Pains',
        'icon': 'assets/images/4AchesAndPains.png',
      },
      {
        'symptom': 'Runny Nose',
        'icon': 'assets/images/5RunnyNose.png',
      },
      {
        'symptom': 'Sore Throat',
        'icon': 'assets/images/6SoreThroat.png',
      },
      {
        'symptom': 'Shortness of Breath',
        'icon': 'assets/images/7DifficultyBreathing.png',
      },
      {
        'symptom': 'Diarrhea',
        'icon': 'assets/images/8Diarrhea.png',
      },
      {
        'symptom': 'Headache',
        'icon': 'assets/images/9Headache.png',
      },
      {
        'symptom': 'None of the above',
        'icon': null,
      },
    ];
    symptoms =
        data.map((e) => Symptom(kind: e['symptom'], image: e['icon'])).toList();

    super.initState();
  }

  bool noSymptomsCheck() {
    bool checking = false;
    for (int x = 0; x < symptoms.length - 1; x++) {
      if (symptoms[x].experiece) {
        checking = true;
      }
    }
    return checking;
  }

  void onNextButtonPressed(BuildContext context) {
    // bool validate = false;
    // symptoms.forEach((element) {
    //   if (element.experiece) {
    //     validate = true;
    //     return;
    //   }
    // });

    // if (validate) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => WriteQuestionsPage(
            details: widget._details,
            symptoms: symptoms,
          ),
        ),
      );
    // } else {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text(
    //           'Choose \'None of the above\' if you don\'t experience any on the list'),
    //     ),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget._details.fullname),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: symptoms.length + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Do you experience the following?',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 12.0),
                ),
                SizedBox(
                  height: 8.0,
                ),
              ],
            );
          }
          if (index == symptoms.length + 1) {
            bool _enabled = false;
            symptoms.forEach((element) {
              if (element.experiece == true) {
                _enabled = true;
                return;
              }
            });
            return SecondaryButton(
                text: 'Next',
                onPressed:
                    _enabled ? () => onNextButtonPressed(context) : null);
          }
          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            margin: EdgeInsets.symmetric(
              vertical: 2.0,
            ),
            // padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Checkbox(
                  checkColor: Colors.black,
                  shape: CircleBorder(),
                  fillColor: MaterialStateProperty.all(Colors.black),
                  value: symptoms[index - 1].experiece,
                  onChanged: (bool? value) {
                    if (symptoms[index - 1].kind == 'None of the above') {
                      if (!symptoms[index - 1].experiece) {
                        for (int x = 0; x < symptoms.length; x++) {
                          symptoms[x].experiece = false;
                        }
                      }

                      symptoms[index - 1].experiece = value!;
                    } else {
                      if (symptoms[symptoms.length - 1].experiece) {
                        symptoms[symptoms.length - 1].experiece = false;
                        symptoms[index - 1].experiece = value!;
                      } else {
                        symptoms[index - 1].experiece = value!;
                      }
                    }
                    setState(() {});
                  },
                ),
                if (symptoms[index - 1].image == null) ...[
                  SizedBox(),
                ] else ...[
                  Image.asset(
                    symptoms[index - 1].image!,
                    filterQuality: FilterQuality.none,
                    height: 50.0,
                    width: 50.0,
                  ),
                ],
                SizedBox(
                  width: 8.0,
                ),
                Text(
                  symptoms[index - 1].kind,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 11.0, fontFamily: 'Arial'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
