import 'package:chimicapp/widgets/container.dart';
import 'package:flutter/material.dart';

class MyFooter extends StatelessWidget {
  const MyFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      myWidget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const <Widget>[
          Text("Copyright ©2022, All Rights Reserved"),
        ],
      ),
    );
  }
}
