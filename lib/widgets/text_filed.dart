import 'package:flutter/material.dart';
import 'package:chimicapp/constants.dart';
import 'package:chimicapp/global_variables.dart';

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

  String myInput = "None";

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
            myInput = myTextEditingController.text;
            gCompound.formula = myInput;
          },
          onTap: () {
            myTextEditingController.clear();
            gCompound.reset();
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
