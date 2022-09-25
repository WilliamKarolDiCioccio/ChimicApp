import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class Constants {
  static const List<Permission> permissions = [
    Permission.microphone,
    Permission.camera
  ];
  static const kPrimarySwatch = Colors.indigo;
  static const kPrimaryColor = kPrimarySwatch;
  static const double phoneWidth = 600;
  static const double tabletWidth = 900;

  static const loremIpsum =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc euismod sollicitudin convallis. Praesent sagittis ante nec magna...";
}
