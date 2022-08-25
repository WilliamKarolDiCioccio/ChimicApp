import 'package:flutter/material.dart';
import 'package:chimicapp/backends/backends.dart';
import 'package:chimicapp/widgets/text_filed.dart';
import 'package:chimicapp/widgets/table.dart';
import 'package:chimicapp/links.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: null,
        title: const Text(
          'CHIMICAPP',
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
              onPressed: () => tryLaunchUrl(gitIssuesUri),
              icon: const Icon(
                Icons.feedback_outlined,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const MyTextField(
              inputLenghtLimit: 255,
              myHintText:
                  "Inserisci il composto ... (Spazia gli elementi, e.g. 'H2 O')",
            ),
            MyTable(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
