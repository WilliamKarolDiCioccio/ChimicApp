// ignore_for_file: depend_on_referenced_packages
import 'package:chimicapp/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';

var logger = Logger(
  filter: null,
  printer: PrettyPrinter(
    lineLength: 120,
    colors: true,
    printEmojis: true,
    printTime: false,
  ),
  output: null,
);

Future<bool> tryLaunchUrl(Uri uri) async {
  if (await canLaunchUrl(uri) == false) {
    return false;
  } else {
    launchUrl(uri, mode: LaunchMode.inAppWebView);
    return true;
  }
}

Future dialog(BuildContext context, String title, String content) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: const <Widget>[],
    ),
  );
}

bool isStringValid(String string) {
  if (string.isEmpty) {
    return false;
  }
  return true;
}

bool widgetResponse(BuildContext context) {
  return MediaQuery.of(context).size.width <= 500 ? true : false;
}

Future<bool> askPermissions() async {
  for (var i = 0; i < Constants.permissions.length; ++i) {
    Constants.permissions[i].request();
    if (await Constants.permissions[i].isGranted == false) return false;
  }
  return true;
}
