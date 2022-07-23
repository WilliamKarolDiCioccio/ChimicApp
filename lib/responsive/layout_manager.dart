import 'package:flutter/material.dart';

class LayoutManager {
  final Widget phoneBody;
  final Widget tabletBody;

  LayoutManager({required this.phoneBody, required this.tabletBody});

  Widget bodyByContext(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return phoneBody;
        } else {
          return tabletBody;
        }
      },
    );
  }
}
