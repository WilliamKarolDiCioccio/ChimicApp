import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final Widget myWidget;

  const MyContainer({required this.myWidget, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.black,
          style: BorderStyle.solid,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: myWidget,
      ),
    );
  }
}
