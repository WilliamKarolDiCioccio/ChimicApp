import 'package:chimicapp/ccompound.dart';
import 'package:flutter/material.dart';
import 'package:chimicapp/constants.dart';
import 'package:provider/provider.dart';
import 'package:chimicapp/providers/compound_provider.dart';

class MyTextField extends StatefulWidget {
  final int inputLenghtLimit;
  final String myHintText;

  const MyTextField(
      {required this.inputLenghtLimit, required this.myHintText, Key? key})
      : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  final TextEditingController myTextEditingController = TextEditingController();
  final CCompound compound = CCompound();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Container(
        decoration: BoxDecoration(
          color: kSecondaryColor,
          border: Border.all(
            width: 3,
            color: kPrimaryColor,
            style: BorderStyle.solid,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 3.5,
              spreadRadius: 3.5,
            )
          ],
        ),
        child: TextField(
          controller: myTextEditingController,
          textAlign: TextAlign.center,
          onSubmitted: (text) {
            compound.formula = myTextEditingController.text;
            compound.update();
            context.read<CompoundProvider>().changeDisplayedCompund(compound);
          },
          onTap: () {
            myTextEditingController.clear();
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
            hintText: widget.myHintText,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    myTextEditingController.dispose();
    super.dispose();
  }
}
