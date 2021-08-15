import 'package:flutter/material.dart';
import 'package:nfc_tool/widgets/primary_button.dart';
import 'package:transparent_image/transparent_image.dart';

import 'write_details_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void onWriteTagButtonPressed(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => WriteDetailsPage()));
  }

  void onDeleteTagButtonPressed() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Text('Welcome to Health Declaration Form NFC Tool'),
        Expanded(
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: 'https://picsum.photos/250?image=9',
          ),
        ),
        Container(
          padding: EdgeInsets.all(8.0),
          color: Theme.of(context).primaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PrimaryButton(
                iconData: Icons.archive_outlined,
                text: 'Write Tag',
                onPressed: () => onWriteTagButtonPressed(context),
              ),
              SizedBox(
                height: 5.0,
              ),
              PrimaryButton(
                iconData: Icons.delete_outline_outlined,
                text: 'Delete Tag',
                onPressed: () {},
              ),
            ],
          ),
        )
      ],
    ));
  }
}
