// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:chimicapp/widgets/text_filed.dart';

Uri projectInfoUrl =
    Uri.parse("https://github.com/WilliamKarolDiCioccio/ChimicApp");

class MyPhoneLayout extends StatelessWidget {
  const MyPhoneLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.withOpacity(0.20),
      appBar: AppBar(
        title: const Text('CHIMICAPP PHONE'),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () => launchUrl(projectInfoUrl),
              icon: const Icon(
                Icons.info_outlined,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const <Widget>[
            MyTextField(myHintText: ""),
          ],
        ),
      ),
    );
  }
}
