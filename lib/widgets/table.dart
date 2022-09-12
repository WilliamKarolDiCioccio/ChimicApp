import 'package:chimicapp/common.dart';
import 'package:chimicapp/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chimicapp/providers/compound.dart';

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
                  content: context.watch<CompoundModel>().iupacName),
            ),
            Center(
              child: MyTableBox(
                  title: "TIPO", content: context.watch<CompoundModel>().type),
            ),
          ],
        ),
        TableRow(children: <Widget>[
          Center(
            child: MyTableBox(
                title: "NOME TRADIZIONALE",
                content: context.watch<CompoundModel>().standardName),
          ),
          Center(
            child: MyTableBox(
                title: "CATEGORIA",
                content: context.watch<CompoundModel>().category),
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
                  content: context.watch<CompoundModel>().iupacName),
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            Center(
              child: MyTableBox(
                  title: "NOME TRADIZIONALE",
                  content: context.watch<CompoundModel>().standardName),
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            Center(
              child: MyTableBox(
                  title: "TIPO", content: context.watch<CompoundModel>().type),
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            Center(
              child: MyTableBox(
                  title: "CATEGORIA",
                  content: context.watch<CompoundModel>().category),
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
      child: MyContainer(
        myWidget: Padding(
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
