import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_tool/model/form.dart';
import 'package:nfc_tool/util/enum.dart';
import 'package:nfc_tool/widgets/custom_radiolisttile.dart';
import 'package:nfc_tool/widgets/custom_showModalBottomSheet.dart';
import 'package:nfc_tool/widgets/primary_button.dart';

class AgreementPage extends StatefulWidget {
  const AgreementPage({required details, required symptoms, required questions})
      : _details = details,
        _questions = questions,
        _symptoms = symptoms;

  final Details _details;
  final List<Symptom> _symptoms;
  final List<Question> _questions;

  @override
  _AgreementPageState createState() => _AgreementPageState();
}

class _AgreementPageState extends State<AgreementPage> {
  String data =
      'I hereby certify that the information given is true, correct and complete. I understand that failure to answer any question falsified response may have serious consequences, I understand that my personal information is protected by RA 10173 or the Data Privacy Act of 2012 and that this form will be destroyed after 20 days from the date of accomplishment.';

  AcceptOrDecline? picked;

  void onWriteButtonPressed(BuildContext context, bool? nfcAvailable) {
    if (picked == AcceptOrDecline.accept) {
      if (nfcAvailable != true) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('NFC is not Available or NFC is off'),
          ),
        );
        setState(() {});
      } else {
        ShowCustomBottomSheet()
            .customShowModalBottomSheet(context: context, nfcTap: NFCTap.write);
      }
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
      body: FutureBuilder<bool>(
        future: NfcManager.instance.isAvailable(),
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        data,
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            fontFamily: 'Gadugi',
                            fontSize: 10.5,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Container(
                        color: Color(0xFFF2F2F2),
                        child: CustomRadioListTile(
                          title: 'I Accept',
                          value: AcceptOrDecline.accept,
                          groupValue: picked,
                          onChanged: (value) {
                            setState(() {
                              picked = value!;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Container(
                        color: Color(0xFFF2F2F2),
                        child: CustomRadioListTile(
                          title: 'I Decline',
                          value: AcceptOrDecline.decline,
                          groupValue: picked,
                          onChanged: (value) {
                            setState(() {
                              picked = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                PrimaryButton(
                  textstyle: Theme.of(context).textTheme.headline6!.copyWith(
                        fontFamily: 'Arial',
                        fontSize: 12.0,
                        color: Colors.white,
                      ),
                  fontColor: Colors.white,
                  backgroundColor: Theme.of(context).primaryColor,
                  iconData: Icons.arrow_circle_down_sharp,
                  onPressed: () => onWriteButtonPressed(context, snapshot.data),
                  text: 'Write data to NFC tag',
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
