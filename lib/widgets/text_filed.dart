import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String myHintText;

  const MyTextField({required this.myHintText, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.purple.withOpacity(0.5),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: myHintText,
          hintStyle: const TextStyle(
            fontSize: 15.0,
          ),
        ),
        enableSuggestions: false,
      ),
    );
  }
}
