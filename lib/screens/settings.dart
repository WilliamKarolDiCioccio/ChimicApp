import 'package:chimicapp/common.dart';
import 'package:chimicapp/providers/theme.dart';
import 'package:chimicapp/widgets/container.dart';
import 'package:chimicapp/widgets/settings_footer.dart';
import 'package:chimicapp/widgets/switch.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:provider/provider.dart';

class MySettings extends StatelessWidget {
  const MySettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (
        context,
        ThemeModel themeNotifier,
        child,
      ) {
        return Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(10),
              child: IconButton(
                icon: const Icon(UniconsLine.home),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(25),
              ),
            ),
            title: const Text(
              "IMPOSTAZIONI",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: (widgetResponse(context) == true) == false,
          ),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MyContainer(
                  myWidget: Column(
                    children: <Widget>[
                      const Text(
                        "TEMA APPLICAZIONE:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: <Widget>[
                          const Text("Tema Scuro:"),
                          const Spacer(),
                          MySwitch(
                            onChanged: () {},
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          const Text("Modalita daltonici:"),
                          const Spacer(),
                          MySwitch(
                            onChanged: () {},
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          const Text("Localita automatica:"),
                          const Spacer(),
                          MySwitch(
                            onChanged: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                MyContainer(
                  myWidget: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Text(
                            "CREDITI:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Text("Di Cioccio William Karol"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Text("Lucente Francesco"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Text("D'Amato Pietro"),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                const MyFooter(),
              ],
            ),
          ),
        );
      },
    );
  }
}
