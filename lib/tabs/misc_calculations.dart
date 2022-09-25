import 'package:chimicapp/widgets/text_field.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyMolecularWeightPage extends StatefulWidget {
  const MyMolecularWeightPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyMolecularWeightPageState();
}

class _MyMolecularWeightPageState extends State<MyMolecularWeightPage> {
  final TextEditingController myTextEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: MyTextField(
              onSubmitted: (text) => {},
              onChanged: (input) => {},
              controller: myTextEditingController,
              myHintText: "Calcola la mole...",
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: MyTextField(
              onSubmitted: (text) => {},
              onChanged: (input) => {},
              controller: myTextEditingController,
              myHintText: "Calcola la molarità...",
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: MyTextField(
              onSubmitted: (text) => {},
              onChanged: (input) => {},
              controller: myTextEditingController,
              myHintText: "Calcola la molalità...",
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
