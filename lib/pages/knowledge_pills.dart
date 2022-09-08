import 'package:chimicapp/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyChartAndMapsPage extends StatefulWidget {
  const MyChartAndMapsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyChartAndMapsPageState();
}

class _MyChartAndMapsPageState extends State<MyChartAndMapsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FutureBuilder(
            builder: (context, snapshot) => ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: kSecondaryColor,
                    border: Border.all(
                      color: kPrimaryColor,
                      width: 3,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  height: 35,
                  child: Center(
                    child: Text("Pillola di conoscenza: ${index + 1}"),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
