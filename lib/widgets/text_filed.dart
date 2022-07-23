import 'package:flutter/material.dart';

import 'package:chimicapp/constants.dart';

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
  final FocusNode myFocusNode = FocusNode();
  final TextEditingController myTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: kSecondaryColor,
          //
          border: Border.all(
            width: 3,
            color: kPrimaryColor,
            style: BorderStyle.solid,
          ),
          //
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: TextField(
          controller: myTextEditingController,
          //
          decoration: InputDecoration(
            border: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            //
            contentPadding: const EdgeInsets.only(
              left: 15,
              bottom: 7,
              top: 15,
              right: 15,
            ),
            //
            hintStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            hintText: widget.myHintText,
            //
            suffixIcon: IconButton(
              icon: const Icon(Icons.search_outlined),
              color: Colors.black,
              iconSize: 30,
              onPressed: () {},
            ),
          ),
          enableSuggestions: false,
        ),
      ),
    );
  }
}
