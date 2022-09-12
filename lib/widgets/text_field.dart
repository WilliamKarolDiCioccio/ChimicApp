import 'package:chimicapp/widgets/container.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final void Function(String) onSubmitted;
  final void Function(String) onChanged;
  final TextEditingController controller;
  final String myHintText;

  const MyTextField(
      {required this.onSubmitted,
      required this.onChanged,
      required this.controller,
      required this.myHintText,
      Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  final TextEditingController myTextEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      myWidget: TextField(
        controller: widget.controller,
        textAlign: TextAlign.center,
        onSubmitted: (text) => widget.onSubmitted(text),
        onChanged: (input) => widget.onChanged(input),
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: const Icon(Icons.close),
            color: Colors.red,
            splashColor: Colors.red.withOpacity(0.25),
            onPressed: () => widget.controller.clear(),
          ),
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
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
