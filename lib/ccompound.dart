// ignore: unused_import
import 'package:chimicapp/backends/backends.dart';

const List<String> tokens = ['(', ')'];

const Map<String, List<int>> elemsOxidationNumber = {
  "Al": [3],
  "Ag": [1],
  "As": [-3, 3, 5],
  "N": [1, 2, 3, 4, 5, -3],
  "Ba": [2],
  "Be": [2],
  "B": [3],
  "Br": [1, 3, 5, -1],
  "Ca": [2],
  "C": [2, 4, -4],
  "Cl": [1, 3, 5, 7, -1],
  "Cr": [6, 3, 2],
  "Co": [2, 3],
  "Fe": [2, 3],
  "F": [-1],
  "H": [1, -1],
  "Pb": [4, 2],
  "Li": [1],
  "Mg": [2],
  "Mn": [2, 3, 4, 6, 7],
  "Hg": [2, 1],
  "Ni": [2, 3],
  "Au": [3, 1],
  "O": [-2, -1],
  "Pd": [2, 4],
  "P": [3, 5, -3],
  "Pt": [2, 4],
  "K": [1],
  "Cu": [2, 1],
  "Si": [2, 4, -4],
  "Na": [1],
  "Sn": [2, 4],
  "Sr": [2],
  "Ti": [4, 3, 2],
  "W": [6, 5, 4, 3, 2],
  "Zn": [2],
  "S": [-2, 6, 4],
};

const Map<String, int> elemsCatTable = {
  "Al": 1,
  "Ag": 1,
  "As": 2,
  "N": 2,
  "Ba": 1,
  "Be": 1,
  "B": 2,
  "Br": 2,
  "Ca": 1,
  "C": 2,
  "Cl": 2,
  "Cr": 1,
  "Co": 1,
  "Fe": 1,
  "F": 2,
  "H": 4,
  "Pb": 1,
  "Li": 1,
  "Mg": 1,
  "Mn": 1,
  "Hg": 1,
  "Ni": 1,
  "Au": 1,
  "O": 3,
  "Pd": 1,
  "P": 2,
  "Pt": 1,
  "K": 1,
  "Cu": 1,
  "Si": 1,
  "Na": 1,
  "Sn": 1,
  "Sr": 1,
  "Ti": 1,
  "W": 1,
  "Zn": 1,
  "S": 2
};

const Map<String, String> elemsNamesTable = {
  "Al": "Alluminio",
  "Ag": "Argento",
  "As": "Arsenico",
  "N": "Azoto",
  "Ba": "Bario",
  "Be": "Berillio",
  "B": "Boro",
  "Br": "Bromo",
  "Ca": "Calcio",
  "C": "Carbonio",
  "Cl": "Cloro",
  "Cr": "Cromo",
  "Co": "Cobalto",
  "Fe": "Ferro",
  "F": "Fluoro",
  "H": "Idrogeno",
  "Pb": "Piombo",
  "Li": "Litio",
  "Mg": "Magnesio",
  "Mn": "Manganese",
  "Hg": "Mercurio",
  "Ni": "Nichel",
  "Au": "Oro",
  "O": "Ossigeno",
  "Pd": "Palladio",
  "P": "Fosforo",
  "Pt": "Platino",
  "K": "Potassio",
  "Cu": "Rame",
  "Si": "Silicio",
  "Na": "Sodio",
  "Sn": "Stagno",
  "Sr": "Stronzio",
  "Ti": "Titanio",
  "W": "Tungsteno",
  "Zn": "Zinco",
  "S": "Zolfo"
};

const Map<String, String> elemsNamesRootTable = {
  "N": "Nitr",
  "B": "Boro",
  "Br": "Brom",
  "C": "Carb",
  "Cl": "Clor",
  "F": "Flor",
  "P": "Fosf",
  "S": "Solf"
};

const Map<String, String> compundCat = {
  "MO": "Ossido Basico",
  "NO": "Ossido Acido",
  "MH": "Idruro Metallico",
  "NH": "Idruro Covalente",
  "MN": "Sale",
  "MHO": "Idrossido",
  "NHO": "Ossiacido",
};

const Map<int, String> prefixesByCount = {
  1: "",
  2: "Di",
  3: "Tri",
  4: "Tetra",
  5: "Penta",
  6: "Esa",
  7: "Epta",
  8: "Octa",
  9: "Enna",
  10: "Deca"
};

class CCompound {
  String formula = "";
  String iupacName = "";
  String compoundType = "";
  String compoundCatergory = "";

  void reset() {
    formula = "";
    iupacName = "";
    compoundType = "";
    compoundCatergory = "";
  }

  Future<void> updateCompoundData() async {
    if (formula.isEmpty) return;

    List<String> elemsGroupsArr = formula.split(" ");

    if (elemsGroupsArr.length == 1) {
      compoundType = "Non è un composto";
      return;
    } else if (elemsGroupsArr.length == 2) {
      compoundType = "Binario";
    } else if (elemsGroupsArr.length == 3) {
      compoundType = "Ternario";
    } else {
      compoundType = "Sconosciuto";
      return;
    }

    List<int> elemsIndicesArr = [1, 1, 1];

    for (var i = 0; i < elemsGroupsArr.length; ++i) {
      String elemIndexStr = elemsGroupsArr[i].replaceAll(RegExp(r'[^0-9]'), '');

      try {
        int elemIndex = int.parse(elemIndexStr);
        elemsIndicesArr[i] = elemIndex;
      } on FormatException {
        continue;
      }
    }

    List<int> elemsArr = [];
    List<String> elemsSymbolsArr = [];

    for (var i = 0; i < elemsGroupsArr.length; ++i) {
      String symbolStr = elemsGroupsArr[i].replaceAll(RegExp(r'[^A-Za-z]'), '');
      elemsSymbolsArr.add(symbolStr);
      int? tmp = elemsCatTable[symbolStr] ?? 0;
      elemsArr.add(tmp);
    }

    String elemsCats = "";

    for (var i = 0; i < elemsArr.length; ++i) {
      if (elemsArr[i] == 1) {
        elemsCats += "M";
      } else if (elemsArr[i] == 2) {
        elemsCats += "N";
      } else if (elemsArr[i] == 3) {
        elemsCats += "O";
      } else if (elemsArr[i] == 4) {
        elemsCats += "H";
      }
    }

    compoundCatergory = compundCat[elemsCats] ?? "Sconosiuta";

    if (compoundCatergory == "Ossido Basico" ||
        compoundCatergory == "Ossido Acido") {
      iupacName =
          "${prefixesByCount[elemsIndicesArr[1]]}Ossido Di ${prefixesByCount[elemsIndicesArr[0]]}${elemsNamesTable[elemsSymbolsArr[0]]}";
    } else if (compoundCatergory == "Idruro Metallico" ||
        compoundCatergory == "Idruro Covalente") {
      iupacName =
          "${prefixesByCount[elemsIndicesArr[1]]}Idruro Di ${prefixesByCount[elemsIndicesArr[0]]}${elemsNamesTable[elemsSymbolsArr[0]]}";
    } else if (compoundCatergory == "Sale") {
      iupacName =
          "${prefixesByCount[elemsIndicesArr[1]]}${elemsNamesRootTable[elemsSymbolsArr[1]]}uro Di ${prefixesByCount[elemsIndicesArr[0]]}${elemsNamesTable[elemsSymbolsArr[0]]}";
    } else if (compoundCatergory == "Idrossido") {
      iupacName =
          "${prefixesByCount[elemsIndicesArr[1]]}Idrossido Di ${prefixesByCount[elemsIndicesArr[0]]}${elemsNamesTable[elemsSymbolsArr[0]]}";
    } else if (compoundCatergory == "Ossiacido") {
      iupacName =
          "Acido ${prefixesByCount[elemsIndicesArr[2]]}osso ${prefixesByCount[elemsIndicesArr[0]]}${elemsNamesRootTable[elemsSymbolsArr[0]]}ico";
    }
  }
}
