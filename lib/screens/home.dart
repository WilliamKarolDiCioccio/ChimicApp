import 'package:chimicapp/pages/knowledge_pills.dart';
import 'package:chimicapp/pages/mole_calculation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:unicons/unicons.dart';
import 'package:chimicapp/common.dart';
import 'package:chimicapp/pages/compound_naming.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  void _initialization() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    FlutterNativeSplash.remove();
  }

  @override
  void initState() {
    super.initState();
    _initialization();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(25),
            ),
          ),
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
                  "IMPOSSIBILE CONTINUARE:",
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
                  "IMPOSSIBILE CONTINUARE:",
                  "Funzionalita temporaneamente disabilitata!",
                ),
                icon: const Icon(
                  Icons.feedback_outlined,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () => Navigator.pushNamed(context, '/settings'),
                icon: const Icon(
                  UniconsLine.setting,
                ),
              ),
            ),
          ],
          bottom: const TabBar(
            indicatorColor: Colors.transparent,
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
                icon: Icon(UniconsLine.brain),
                text: "PILLOLE",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            MyCompoundNamingPage(),
            MyMolecularWeightPage(),
            MyKnowledgePillsPage(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
