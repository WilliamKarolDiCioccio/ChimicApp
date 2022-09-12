import 'package:flutter/material.dart';

class MySwitch extends StatefulWidget {
  final void Function() onChanged;

  const MySwitch({required this.onChanged, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  bool isSwitched = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      activeTrackColor: Colors.blue,
      activeColor: Colors.indigo,
      splashRadius: 1,
      value: isSwitched,
      onChanged: (value) {
        widget.onChanged;
        return setState(() {
          isSwitched = value;
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
