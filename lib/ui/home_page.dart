import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_tool/util/enum.dart';
import 'package:nfc_tool/widgets/custom_showModalBottomSheet.dart';
import 'package:nfc_tool/widgets/primary_button.dart';

import 'write_details_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void onWriteTagButtonPressed(BuildContext context, bool? nfcAvailable) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => WriteDetailsPage()));
  }

  void onDeleteTagButtonPressed(BuildContext context, bool? nfcAvailable) {
    if (nfcAvailable != true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('NFC is not Available or NFC is off'),
        ),
      );
      setState(() {});
    } else {
      ShowCustomBottomSheet()
          .customShowModalBottomSheet(context: context, nfcTap: NFCTap.remove);
    }

    // showModalBottomSheet(
    //   context: context,
    //   isDismissible: false,
    //   enableDrag: false,
    //   backgroundColor: Colors.transparent,
    //   builder: (context) {
    //     return Container(
    //       decoration: BoxDecoration(
    //         color: Colors.white,
    //         borderRadius: BorderRadius.circular(10.0),
    //       ),
    //       margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
    //       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.stretch,
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           Text(
    //             'Ready to Tap',
    //             textAlign: TextAlign.center,
    //             style: Theme.of(context).textTheme.headline4,
    //           ),
    //           Image.asset(
    //             'assets/images/Approach.gif',
    //             height: 100.0,
    //             width: 100.0,
    //           ),
    //           Text(
    //             'Approach an NFC Tag',
    //             textAlign: TextAlign.center,
    //             style: Theme.of(context).textTheme.subtitle2,
    //           ),
    //           SizedBox(
    //             height: 8.0,
    //           ),
    //           SecondaryButton(
    //             onPressed: () {
    //               Navigator.of(context).pop();
    //             },
    //             backroudColor: Color(0xFFE7E6E6),
    //             fontColor: Colors.black,
    //             text: 'Cancel',
    //           )
    //         ],
    //       ),
    //     );
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(
          future: NfcManager.instance.isAvailable(),
          builder: (context, snapshot) {
            return Column(
              children: [
                Container(
                  height: 100,
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Welcome to Health Declaration Form NFC Tool',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Expanded(
                  child: Image.asset('assets/images/nfctool-logo.png'),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                  color: Theme.of(context).primaryColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      PrimaryButton(
                        textstyle: Theme.of(context).textTheme.headline5,
                        iconData: Icons.save_alt_sharp,
                        text: 'Write Tag',
                        onPressed: () =>
                            onWriteTagButtonPressed(context, snapshot.data),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      PrimaryButton(
                        textstyle: Theme.of(context).textTheme.headline5,
                        iconData: Icons.delete_outline_outlined,
                        text: 'Delete Tag',
                        onPressed: () =>
                            onDeleteTagButtonPressed(context, snapshot.data),
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
