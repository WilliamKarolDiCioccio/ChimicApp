import 'package:flutter/material.dart';

import 'package:chimicapp/responsive/layout_manager.dart';
import 'package:chimicapp/responsive/phone_layout.dart';
import 'package:chimicapp/responsive/desktop_layout.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const LayoutManager(
      phoneLayout: MyPhoneLayout(),
      desktopLayout: MyDesktopLayout(),
    );
  }
}
