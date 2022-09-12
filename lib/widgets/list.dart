import 'package:chimicapp/widgets/container.dart';
import 'package:chimicapp/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class MyKnowledgePill {
  final String title;
  final RichText content;
  final List<String> tags;

  MyKnowledgePill(
      {required this.title, required this.content, required this.tags});
}

var allPills = [
  MyKnowledgePill(
    title: "Leggi ponderali",
    content: RichText(text: const TextSpan(text: "")),
    tags: ["lavoisier", "proust", "dalton"],
  ),
  MyKnowledgePill(
    title: "Tavola periodica",
    content: RichText(text: const TextSpan(text: "")),
    tags: ["numero_atomico", "elettronegatività", "numero_ossidazione"],
  ),
  MyKnowledgePill(
    title: "Avogadro & Canizzaro",
    content: RichText(text: const TextSpan(text: "")),
    tags: ["mole", "massa_molare", "numero_di_avogadro"],
  ),
  MyKnowledgePill(
    title: "Modelli atomici",
    content: RichText(text: const TextSpan(text: "")),
    tags: ["thomson", "rutherford", "bohr"],
  ),
  MyKnowledgePill(
    title: "Fisica quantistica",
    content: RichText(text: const TextSpan(text: "")),
    tags: ["nihels_bohr", "orbitali", "schrodinger"],
  ),
  MyKnowledgePill(
    title: "Geometria molecolare",
    content: RichText(text: const TextSpan(text: "")),
    tags: ["forza_repulsione", "nihels_bohr", "teoria_vsepr"],
  ),
  MyKnowledgePill(
    title: "Composti binari",
    content: RichText(text: const TextSpan(text: "")),
    tags: ["ossidi_basici_acidi", "idruri_idracidi", "sali_molecolari"],
  ),
  MyKnowledgePill(
    title: "Composti ternari",
    content: RichText(text: const TextSpan(text: "")),
    tags: ["idrossidi", "acidi_ossigenati", "sali_acidi"],
  ),
];

class MyListTile extends StatelessWidget {
  final MyKnowledgePill item;

  const MyListTile({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: const Icon(
        UniconsLine.lightbulb,
        color: Colors.orangeAccent,
      ),
      title: Text(item.title),
      childrenPadding: const EdgeInsets.all(10),
      iconColor: Colors.black,
      textColor: Colors.black,
      children: const <Widget>[MyContainer(myWidget: Text("LyListTile"))],
    );
  }
}

class MyList extends StatefulWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  final TextEditingController myTextEditingController = TextEditingController();
  var pills = allPills;

  void searchFilterPills(String query) {
    final suggestions = allPills.where((pill) {
      final input = query.toLowerCase();
      for (var i in pill.tags) {
        if (i.contains(input) == true) {
          return true;
        } else {
          continue;
        }
      }
      return false;
    }).toList();

    setState(() => pills = suggestions);
  }

  void resetSearchFilter() {
    setState(() => pills = allPills);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: MyTextField(
            onSubmitted: (text) => {},
            onChanged: (input) => searchFilterPills(input),
            controller: myTextEditingController,
            myHintText: "Cerca una pillola...",
          ),
        ),
        Expanded(
          child: FutureBuilder(
            builder: (context, snapshot) => ListView.builder(
              itemCount: pills.length,
              itemBuilder: (context, index) {
                final MyKnowledgePill pill = pills[index];
                return MyListTile(
                  item: pill,
                );
              },
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
