import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_tool/model/form.dart';
import 'package:nfc_tool/util/enum.dart';
import 'package:nfc_tool/widgets/custom_showDialog.dart';
import 'package:nfc_tool/widgets/secondary_button.dart';

// Map<String, dynamic> data = {
//   "full name": "jeff zaga",
//   "college": "STI Cubao",
// };

// final String sData = json.encode(data);

class ShowCustomBottomSheet {
  ShowCustomBottomSheet({details}) : _details = details;

  ValueNotifier<dynamic> _result = ValueNotifier(null);
  bool scanned = false;

  Details? _details;

  void customShowModalBottomSheet(
      {required BuildContext context, required NFCTap nfcTap}) {
    if (nfcTap == NFCTap.write) {
      NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
        var ndef = Ndef.from(tag);
        if (ndef == null || !ndef.isWritable) {
          _result.value = 'Tag is not ndef writable';
          NfcManager.instance.stopSession(errorMessage: _result.value);
          return;
        }

        final stringDetails = json.encode(_details!.toMap());

        NdefMessage message = NdefMessage([
          NdefRecord.createText(stringDetails),
          // NdefRecord.createText('Hello World Second!'),
          // NdefRecord.createUri(Uri.parse('https://flutter.dev')),
          // NdefRecord.createMime(
          //     'text/plain', Uint8List.fromList('Hello Second'.codeUnits)),
          // NdefRecord.createExternal('com.example', 'mytype',
          //     Uint8List.fromList('mydata Second'.codeUnits)),
        ]);

        try {
          await ndef.write(message);
          _result.value = 'Success to "Ndef Write"';
          NfcManager.instance.stopSession();
        } catch (e) {
          _result.value = e;
          NfcManager.instance
              .stopSession(errorMessage: _result.value.toString());
          return;
        }
      });
    } else if (nfcTap == NFCTap.remove) {
      NfcManager.instance.startSession(
        onDiscovered: (NfcTag tag) async {
          _result.value =
              tag.data['ndef']['cachedMessage']['records'][0]['payload'];
          print(String.fromCharCodes(_result.value));
          // _result.value = NdefMessage(tag.data['']);
          NfcManager.instance.stopSession();
          Navigator.pop(context);
          CustomShowDialog(
                  title: 'Erase Successful',
                  imageAsset: 'assets/images/Confirmation.gif',
                  description:
                      'Your Health Declaration Form was deleted from your NFC tag.')
              .showCustomDialog(context);
        },
      );
    }

    // !scanned ?

    // showDialog(context: context, builder: (context){
    //   return AlertDialog(
    //     title: const Text('Upload Successful'),
    //     content: SingleChildScrollView(
    //       child: ListBody(
    //         children:  <Widget>[
    //           Image.asset(
    //               'assets/images/Approach.gif',
    //               height: 100.0,
    //               width: 100.0,
    //             ),
    //           Text('Your Health Declaration Form was uploaded to your NFC tag.'),
    //         ],
    //       ),
    //     ),
    //     actions: <Widget>[
    //       TextButton(
    //         child: const Text('Approve'),
    //         onPressed: () {
    //           Navigator.of(context).pop();
    //         },
    //       ),
    //     ],
    //   );
    // })

    // :

    showModalBottomSheet(
      context: context,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Ready to Tap',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4,
                ),
                Image.asset(
                  'assets/images/Approach.gif',
                  height: 100.0,
                  width: 100.0,
                ),
                Text(
                  'Approach an NFC Tag',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                ValueListenableBuilder(
                  valueListenable: _result,
                  builder: (context, value, _) => Text('${value ?? ''}'),
                ),
                SizedBox(
                  height: 8.0,
                ),
                SecondaryButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  backroudColor: Color(0xFFE7E6E6),
                  fontColor: Colors.black,
                  text: 'Cancel',
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
