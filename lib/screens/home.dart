import 'package:flutter/material.dart';
import 'package:chimicapp/links.dart';
import 'package:chimicapp/backends/backends.dart';
import 'package:chimicapp/pages/compound_naming.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'CHIMICAPP',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: (widgetResponse(context) == true) == false,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () => tryLaunchUrl(gitHubUri, context),
                icon: const Icon(
                  Icons.code,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () => tryLaunchUrl(gitIssuesUri, context),
                icon: const Icon(
                  Icons.feedback_outlined,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.accessibility_outlined,
                ),
              ),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.search_outlined), text: "ANALIZZA"),
              Tab(
                icon: Icon(Icons.grid_4x4_outlined),
                text: "FEATURE",
              ),
              Tab(
                icon: Icon(Icons.grid_4x4_outlined),
                text: "FEATURE",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            MyCompoundNamingPage(),
            Text("Implementazione futura"),
            Text("Implementazione futura"),
          ],
        ),
      ),
    );
  }
}
