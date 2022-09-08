import 'package:flutter/material.dart';
import 'package:chimicapp/backends/backends.dart';
import 'package:chimicapp/links.dart';
import 'package:unicons/unicons.dart';

class MyFooter extends StatelessWidget {
  const MyFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[100],
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: const Icon(
                    UniconsLine.info,
                  ),
                  onPressed: () => tryLaunchUrl(gitReleasesUri),
                ),
                const Text(
                  "Informazioni di versione",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text("Copyright ©2022, All Rights Reserved"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text("Powered By SNDevs"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
