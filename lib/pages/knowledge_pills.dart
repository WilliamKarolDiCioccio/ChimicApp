import 'package:flutter/material.dart';
import 'package:chimicapp/widgets/list.dart';

// ignore: must_be_immutable
class MyKnowledgePillsPage extends StatefulWidget {
  const MyKnowledgePillsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyKnowledgePillsPageState();
}

class _MyKnowledgePillsPageState extends State<MyKnowledgePillsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyList(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
