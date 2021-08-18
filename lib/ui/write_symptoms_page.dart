import 'package:flutter/material.dart';
import 'package:nfc_tool/model/form.dart';
import 'package:nfc_tool/widgets/secondary_button.dart';

class WriteSymptomsPage extends StatefulWidget {
  const WriteSymptomsPage({required details}) : _details = details;

  final Details _details;

  @override
  _WriteSymptomsPageState createState() => _WriteSymptomsPageState();
}

class _WriteSymptomsPageState extends State<WriteSymptomsPage> {
  List<String> data = [];
  List<Symptom> symptoms = [];

  @override
  void initState() {
    data = [
      'Feve',
      'Dry Cough',
      'Fatigue',
      'Aces and Pains',
      'Runny Nose',
      'Sore Throat',
      'Shortness of Breath',
      'Diarrhea',
      'Headache',
      'None of the above',
    ];
    symptoms = data.map((e) => Symptom(kind: e, experiece: false)).toList();

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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget._details.fullname),
      ),
      body: ListView.builder(
        itemCount: symptoms.length + 1,
        itemBuilder: (context, index) {
          if (index == symptoms.length  ) {
            return SecondaryButton(text: 'Next', onPressed: () => {});
          }
          return Row(
            children: [
              Checkbox(
                checkColor: Colors.black,
                shape: CircleBorder(),
                fillColor: MaterialStateProperty.all(Colors.black),
                value: symptoms[index].experiece,
                onChanged: (bool? value) {
                  if (symptoms[index].kind == 'None of the above') {
                    if (!symptoms[index].experiece) {
                      for (int x = 0; x < symptoms.length - 1; x++) {
                        symptoms[x].experiece = false;
                      }
                    }

                    symptoms[index].experiece = value!;
                  } else {
                    if (symptoms[symptoms.length - 1].experiece) {
                      symptoms[symptoms.length - 1].experiece = false;
                      symptoms[index].experiece = value!;
                    } else {
                      symptoms[index].experiece = value!;
                    }
                  }
                  setState(() {});
                },
              ),
              Text(symptoms[index].kind),
            ],
          );
        },
      ),
    );
  }
}
