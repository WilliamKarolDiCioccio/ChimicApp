import 'package:chimicapp/pages/knowledge_pills.dart';
import 'package:chimicapp/pages/mole_calculation.dart';
import 'package:flutter/material.dart';
import 'package:chimicapp/backends/backends.dart';
import 'package:chimicapp/pages/compound_naming.dart';
import 'package:unicons/unicons.dart';

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
                onPressed: () => dialog(
                  context,
                  "IMPOSSIBILE:",
                  "Funzionalita temporaneamente disabilitata!",
                ),
                icon: const Icon(
                  Icons.code_outlined,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () => dialog(
                  context,
                  "IMPOSSIBILE",
                  "Funzionalita temporaneamente disabilitata!",
                ),
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
                  UniconsLine.setting,
                ),
              ),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(UniconsLine.microscope),
                text: "NOME",
              ),
              Tab(
                icon: Icon(UniconsLine.balance_scale),
                text: "MOLE",
              ),
              Tab(
                icon: Icon(UniconsLine.comment_lines),
                text: "PILLOLE",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            MyCompoundNamingPage(),
            MyMolecularWeightPage(),
            MyChartAndMapsPage(),
          ],
        ),
      ),
    );
  }
}
