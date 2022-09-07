import 'package:chimicapp/backends/backends.dart';
import 'package:flutter/material.dart';
import 'package:chimicapp/constants.dart';
import 'package:provider/provider.dart';
import 'package:chimicapp/providers/compound_provider.dart';

class MyTableBox extends StatelessWidget {
  final String title;
  final String content;

  const MyTableBox({required this.title, required this.content, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Text(
          content,
        ),
      ],
    );
  }
}

class MyWideTableLayout extends StatelessWidget {
  const MyWideTableLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: <Widget>[
            Center(
              child: MyTableBox(
                  title: "NOME IUPAC",
                  content: context.watch<CompoundProvider>().iupacName),
            ),
            Center(
              child: MyTableBox(
                  title: "TIPO",
                  content: context.watch<CompoundProvider>().type),
            ),
          ],
        ),
        TableRow(children: <Widget>[
          Center(
            child: MyTableBox(
                title: "NOME TRADIZIONALE",
                content: context.watch<CompoundProvider>().standardName),
          ),
          Center(
            child: MyTableBox(
                title: "CATEGORIA",
                content: context.watch<CompoundProvider>().category),
          ),
        ])
      ],
    );
  }
}

class MyNarrowTableLayout extends StatelessWidget {
  const MyNarrowTableLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: <Widget>[
            Center(
              child: MyTableBox(
                  title: "NOME IUPAC",
                  content: context.watch<CompoundProvider>().iupacName),
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            Center(
              child: MyTableBox(
                  title: "NOME TRADIZIONALE",
                  content: context.watch<CompoundProvider>().standardName),
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            Center(
              child: MyTableBox(
                  title: "TIPO",
                  content: context.watch<CompoundProvider>().type),
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            Center(
              child: MyTableBox(
                  title: "CATEGORIA",
                  content: context.watch<CompoundProvider>().category),
            ),
          ],
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class MyTable extends StatefulWidget {
  const MyTable({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyTableState();
}

class _MyTableState extends State<MyTable> {
  @override
  void initState() {
    super.initState();
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
          child: Column(
            children: [
              if (widgetResponse(context) == true) const MyNarrowTableLayout(),
              if (widgetResponse(context) == false) const MyWideTableLayout(),
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
