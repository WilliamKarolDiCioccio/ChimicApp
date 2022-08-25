import 'dart:async';
import 'package:flutter/material.dart';
import 'package:chimicapp/constants.dart';
import 'package:chimicapp/global_variables.dart';

// ignore: must_be_immutable
class MyTable extends StatefulWidget {
  MyTable({Key? key}) : super(key: key);

  String formulaBuffer = "";

  @override
  State<StatefulWidget> createState() => _MyTableState();
}

class _MyTableState extends State<MyTable> {
  @override
  void initState() {
    super.initState();
    setState(
      () {
        const oneSecond = Duration(seconds: 1);
        Timer.periodic(
          oneSecond,
          (Timer t) => setState(
            () {
              if (gCompound.formula != widget.formulaBuffer) {
                gCompound.formulaToName();
                widget.formulaBuffer = gCompound.formula;
              }
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Container(
        decoration: BoxDecoration(
          color: kSecondaryColor,
          border: Border.all(
            width: 3,
            color: kPrimaryColor,
            style: BorderStyle.solid,
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 3.5,
              spreadRadius: 3.5,
            )
          ],
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Table(
            children: [
              TableRow(
                children: <Widget>[
                  Center(
                    child: Column(
                      children: [
                        const Text(
                          "NOME IUPAC",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          gCompound.iupacName,
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        const Text(
                          "TIPO",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          gCompound.compoundType,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              TableRow(children: <Widget>[
                Center(
                  child: Column(
                    children: [
                      const Text(
                        "NOME STANDARD",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        gCompound.standardName,
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      const Text(
                        "CATEGORIA",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        gCompound.compoundCatergory,
                      ),
                    ],
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
