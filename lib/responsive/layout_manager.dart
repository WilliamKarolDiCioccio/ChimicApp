import 'package:flutter/material.dart';

import 'package:chimicapp/responsive/config.dart';

class LayoutManager extends StatelessWidget {
  final Widget phoneLayout;
  final Widget desktopLayout;

  const LayoutManager(
      {required this.phoneLayout, required this.desktopLayout, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < phoneWidth) {
          return phoneLayout;
        } else {
          return desktopLayout;
        }
      },
    );
  }
}
