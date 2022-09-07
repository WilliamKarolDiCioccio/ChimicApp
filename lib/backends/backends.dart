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

Future<void> tryLaunchUrl(Uri uri, BuildContext context) async {
  if (await canLaunchUrl(uri) == false) {
    dialog(context, "URL ERROR", "Unable to open link $uri", []);
  } else {
    launchUrl(uri, mode: LaunchMode.inAppWebView);
  }
}

Future dialog(
    BuildContext context, String title, String content, List<String> buttons) {
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
  for (var i = 0; i < permissions.length; ++i) {
    permissions[i].request();
    if (await permissions[i].isGranted == false) return false;
  }
  return true;
}
