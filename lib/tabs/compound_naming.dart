import 'package:chimicapp/constants.dart';
import 'package:chimicapp/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:provider/provider.dart';
import 'package:chimicapp/providers/compound.dart';
import 'package:chimicapp/backends/compound_parser.dart';
import 'package:chimicapp/widgets/table.dart';

// ignore: must_be_immutable
class MyCompoundNamingPage extends StatefulWidget {
  const MyCompoundNamingPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyCompoundNamingPageState();
}

class _MyCompoundNamingPageState extends State<MyCompoundNamingPage> {
  final Compound compound = Compound();
  final CompoundParser parser = CompoundParser();
  final TextEditingController myTextEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: MyTextField(
                onSubmitted: (text) {
                  compound.formula = myTextEditingController.text;
                  parser.update(compound);
                  context
                      .read<CompoundModel>()
                      .changeDisplayedCompund(compound);
                },
                onChanged: (input) => {},
                controller: myTextEditingController,
                myHintText: "Analizza un composto...",
              )),
          const MyTable(),
          const Spacer(),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "btn1",
            tooltip: "Cambia verso",
            onPressed: () {},
            backgroundColor: Constants.kPrimaryColor,
            child: const Icon(Icons.change_circle_outlined),
          ),
          const SizedBox(width: 15),
          FloatingActionButton(
            heroTag: "btn2",
            tooltip: "Fotografa un composto",
            onPressed: () {},
            backgroundColor: Constants.kPrimaryColor,
            child: const Icon(UniconsLine.camera),
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
