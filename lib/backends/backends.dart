import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

// ignore: depend_on_referenced_packages
import 'package:url_launcher/url_launcher.dart';

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

Future<void> tryLaunchUrl(Uri uri) async {
  if (await canLaunchUrl(uri) == false) {
    AlertDialog(
      title: const Text('ERROR'),
      content: Text('Could not launch $uri'),
    );
  } else {
    launchUrl(uri, mode: LaunchMode.inAppWebView);
  }
}
