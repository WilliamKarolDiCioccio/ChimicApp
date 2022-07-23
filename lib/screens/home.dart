// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:chimicapp/backends/backends.dart';
import 'package:chimicapp/responsive/layout_manager.dart';
import 'package:chimicapp/widgets/text_filed.dart';
import 'package:chimicapp/links.dart';

final Widget myBody1 = Scaffold(
  backgroundColor: Colors.white,
  appBar: AppBar(
    leading: null,
    title: const Text(
      'C H I M I C A P P',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    centerTitle: false,
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: IconButton(
          onPressed: () => tryLaunchUrl(gitHubUri),
          icon: const Icon(
            Icons.info_outlined,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: IconButton(
          onPressed: () {
            // Push new page
          },
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
        MyTextField(
          inputLenghtLimit: 255,
          myHintText: "Write the compound to be analyzed ...",
        ),
      ],
    ),
  ),
);

final Widget myBody2 = Scaffold(
  backgroundColor: Colors.white,
  appBar: AppBar(
    leading: null,
    title: const Text(
      'C H I M I C A P P',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    centerTitle: true,
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: IconButton(
          onPressed: () => tryLaunchUrl(gitHubUri),
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
        MyTextField(
          inputLenghtLimit: 255,
          myHintText: "Write the compound to be analyzed ...",
        ),
      ],
    ),
  ),
);

class MyHome extends StatelessWidget {
  MyHome({Key? key}) : super(key: key);

  final LayoutManager myLayoutManager = LayoutManager(
    phoneBody: myBody1,
    tabletBody: myBody2,
  );

  @override
  Widget build(BuildContext context) {
    return myLayoutManager.bodyByContext(context);
  }
}
