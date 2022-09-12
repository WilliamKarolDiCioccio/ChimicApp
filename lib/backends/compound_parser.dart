import 'package:chimicapp/providers/compound.dart';

const Map<String, List<int>> elemsOxidationNumber = {
  "al": [3],
  "ag": [1],
  "as": [-3, 3, 5],
  "n": [1, 2, 3, 4, 5, -3],
  "ba": [2],
  "be": [2],
  "b": [3],
  "br": [1, 3, 5, -1],
  "ca": [2],
  "c": [2, 4, -4],
  "cl": [1, 3, 5, 7, -1],
  "cr": [6, 3, 2],
  "co": [2, 3],
  "fe": [2, 3],
  "f": [-1],
  "h": [1, -1],
  "pb": [4, 2],
  "li": [1],
  "mg": [2],
  "mn": [2, 3, 4, 6, 7],
  "hg": [2, 1],
  "ni": [2, 3],
  "au": [3, 1],
  "o": [-2, -1],
  "pd": [2, 4],
  "p": [3, 5, -3],
  "pt": [2, 4],
  "k": [1],
  "cu": [2, 1],
  "si": [2, 4, -4],
  "na": [1],
  "sn": [2, 4],
  "sr": [2],
  "ti": [4, 3, 2],
  "w": [6, 5, 4, 3, 2],
  "zn": [2],
  "s": [-2, 6, 4],
};

const Map<String, double> elemsElectronegativityTable = {
  "n": 3.0,
  "b": 2.0,
  "br": 3.0,
  "c": 2.6,
  "cl": 3.2,
  "f": 4.0,
  "p": 2.2,
  "s": 2.6
};

const Map<String, int> elemsCatTable = {
  "al": 1,
  "ag": 1,
  "as": 2,
  "n": 2,
  "ba": 1,
  "be": 1,
  "b": 2,
  "br": 2,
  "ca": 1,
  "c": 2,
  "cl": 2,
  "cr": 1,
  "co": 1,
  "fe": 1,
  "f": 2,
  "h": 4,
  "pb": 1,
  "li": 1,
  "mg": 1,
  "mn": 1,
  "hg": 1,
  "ni": 1,
  "au": 1,
  "o": 3,
  "pd": 1,
  "p": 2,
  "pt": 1,
  "k": 1,
  "cu": 1,
  "si": 1,
  "na": 1,
  "sn": 1,
  "sr": 1,
  "ti": 1,
  "w": 1,
  "zn": 1,
  "s": 2
};

const Map<String, String> elemsNamesTable = {
  "al": "Alluminio",
  "ag": "Argento",
  "as": "Arsenico",
  "n": "Azoto",
  "ba": "Bario",
  "be": "Berillio",
  "b": "Boro",
  "br": "Bromo",
  "ca": "Calcio",
  "c": "Carbonio",
  "cl": "Cloro",
  "cr": "Cromo",
  "co": "Cobalto",
  "fe": "Ferro",
  "f": "Fluoro",
  "h": "Idrogeno",
  "pb": "Piombo",
  "li": "Litio",
  "mg": "Magnesio",
  "mn": "Manganese",
  "hg": "Mercurio",
  "ni": "Nichel",
  "au": "Oro",
  "o": "Ossigeno",
  "pd": "Palladio",
  "p": "Fosforo",
  "pt": "Platino",
  "k": "Potassio",
  "cu": "Rame",
  "si": "Silicio",
  "na": "Sodio",
  "sn": "Stagno",
  "sr": "Stronzio",
  "ti": "Titanio",
  "w": "Tungsteno",
  "zn": "Zinco",
  "s": "Zolfo"
};

const Map<String, String> elemsNamesRootTable = {
  "n": "Nitr",
  "b": "Bor",
  "br": "Brom",
  "c": "Carbon",
  "cl": "Clor",
  "f": "Fluor",
  "p": "Fosf",
  "s": "Solf"
};

const Map<String, String> compundCat = {
  "[M, O]": "Ossido Basico",
  "[N, O]": "Ossido Acido",
  "[H, M]": "Idruro Metallico",
  "[H, N]": "Idruro Covalente",
  "[M, N]": "Sale",
  "[N, N]": "Composto Molecolare",
  "[H, M, O]": "Idrossido",
  "[H, N, O]": "Ossiacido",
  "[H, O]": "Ossido"
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

const List<String> tokens = ['(', ')', ' '];

class CompoundParser {
  void reset(Compound compound) {
    compound.formula = "";
    compound.iupacName = "";
    compound.type = "";
    compound.category = "";
  }

  void copy(Compound compound1, Compound compound2) {
    compound2.formula = compound1.formula;
    compound2.iupacName = compound1.iupacName;
    compound2.type = compound1.type;
    compound2.category = compound1.category;
  }

  Future<void> update(Compound compound) async {
    if (compound.formula.isEmpty) {
      reset(compound);
      return;
    }

    Compound tempCompound = Compound();
    copy(compound, tempCompound);

    String formulaStr = tempCompound.formula.toLowerCase();

    List<String> elemsGroupsArr = formulaStr.split(" ");

    List<int> elemsArr = [];
    List<String> elemsSymbolsArr = [];

    for (var i = 0; i < elemsGroupsArr.length; ++i) {
      String symbolStr = elemsGroupsArr[i].replaceAll(RegExp(r'[^A-Za-z]'), '');
      elemsSymbolsArr.add(symbolStr);
      int? tmp = elemsCatTable[symbolStr] ?? 0;
      if (tmp == 0) {
        tempCompound.type = "Indeterminabile";
        tempCompound.category = "Elemento sconosciuto: '$symbolStr'";
        tempCompound.iupacName = "Indeterminabile";
        return copy(tempCompound, compound);
      }
      elemsArr.add(tmp);
    }

    if (elemsGroupsArr.length == 1) {
      tempCompound.type = "Non è un composto";
    } else if (elemsGroupsArr.length == 2) {
      tempCompound.type = "Binario";
    } else if (elemsGroupsArr.length == 3) {
      tempCompound.type = "Ternario";
    } else {
      tempCompound.type = "Sconosciuto";
    }

    if (tempCompound.type == "Sconosciuto") {
      tempCompound.category = "Indeterminabile";
      tempCompound.iupacName = "Indeterminabile";
      return copy(tempCompound, compound);
    }

    List<String> ordererdElemsCatsArr = [];
    List<String> unordererdElemsCatsArr = [];

    for (var i = 0; i < elemsArr.length; ++i) {
      if (elemsArr[i] == 1) {
        ordererdElemsCatsArr.add("M");
        unordererdElemsCatsArr.add("M");
      } else if (elemsArr[i] == 2) {
        ordererdElemsCatsArr.add("N");
        unordererdElemsCatsArr.add("N");
      } else if (elemsArr[i] == 3) {
        ordererdElemsCatsArr.add("O");
        unordererdElemsCatsArr.add("O");
      } else if (elemsArr[i] == 4) {
        ordererdElemsCatsArr.add("H");
        unordererdElemsCatsArr.add("H");
      }
    }

    ordererdElemsCatsArr.sort((a, b) {
      return a.compareTo(b);
    });

    tempCompound.category = compundCat[ordererdElemsCatsArr.toString()] ?? "";
    if (tempCompound.category.isEmpty) {
      tempCompound.category = "Sconosciuta";
      tempCompound.iupacName = "Indeterminabile";
      return copy(tempCompound, compound);
    }

    List<int> elemsIndicesArr = [1, 1, 1];

    for (var i = 0; i < elemsGroupsArr.length; ++i) {
      String elemIndexStr = elemsGroupsArr[i].replaceAll(RegExp(r'[^0-9]'), '');

      try {
        elemsIndicesArr[i] = int.parse(elemIndexStr);
      } on FormatException {
        continue;
      }
    }

    if (tempCompound.type == "Binario") {
      if (tempCompound.category == "Ossido") {
        if (unordererdElemsCatsArr.toString() == "[H, O]" &&
            elemsIndicesArr[0] == 1) {
          tempCompound.iupacName =
              "${prefixesByCount[elemsIndicesArr[1]]}Ossido Di ${prefixesByCount[elemsIndicesArr[0]]}${elemsNamesTable[elemsSymbolsArr[0]]}";
        } else {
          tempCompound.iupacName =
              "${prefixesByCount[elemsIndicesArr[0]]}Ossido Di ${prefixesByCount[elemsIndicesArr[1]]}${elemsNamesTable[elemsSymbolsArr[1]]}";
        }
      }
      if (tempCompound.category == "Ossido Basico" ||
          tempCompound.category == "Ossido Acido") {
        if (unordererdElemsCatsArr.toString() == "[M, O]" ||
            unordererdElemsCatsArr.toString() == "[N, O]") {
          tempCompound.iupacName =
              "${prefixesByCount[elemsIndicesArr[1]]}Ossido Di ${prefixesByCount[elemsIndicesArr[0]]}${elemsNamesTable[elemsSymbolsArr[0]]}";
        } else {
          tempCompound.iupacName =
              "${prefixesByCount[elemsIndicesArr[0]]}Ossido Di ${prefixesByCount[elemsIndicesArr[1]]}${elemsNamesTable[elemsSymbolsArr[1]]}";
        }
      } else if (tempCompound.category == "Idruro Metallico") {
        if (unordererdElemsCatsArr.toString() == "[M, H]") {
          tempCompound.iupacName =
              "${prefixesByCount[elemsIndicesArr[1]]}Idruro Di ${prefixesByCount[elemsIndicesArr[0]]}${elemsNamesTable[elemsSymbolsArr[0]]}";
        } else {
          tempCompound.iupacName =
              "${prefixesByCount[elemsIndicesArr[0]]}Idruro Di ${prefixesByCount[elemsIndicesArr[1]]}${elemsNamesTable[elemsSymbolsArr[1]]}";
        }
      } else if (tempCompound.category == "Idruro Covalente") {
        if (unordererdElemsCatsArr.toString() == "[N, H]") {
          tempCompound.iupacName =
              "acido ${elemsNamesRootTable[elemsSymbolsArr[0]]}idrico";
        } else {
          tempCompound.iupacName =
              "acido ${elemsNamesRootTable[elemsSymbolsArr[1]]}idrico";
        }
      } else if (tempCompound.category == "Sale") {
        if (unordererdElemsCatsArr.toString() == "[M, N]") {
          tempCompound.iupacName =
              "${prefixesByCount[elemsIndicesArr[1]]}${elemsNamesRootTable[elemsSymbolsArr[1]]}uro Di ${prefixesByCount[elemsIndicesArr[0]]}${elemsNamesTable[elemsSymbolsArr[0]]}";
        } else {
          tempCompound.iupacName =
              "${prefixesByCount[elemsIndicesArr[0]]}${elemsNamesRootTable[elemsSymbolsArr[0]]}uro Di ${prefixesByCount[elemsIndicesArr[1]]}${elemsNamesTable[elemsSymbolsArr[1]]}";
        }
      } else if (tempCompound.category == "Composto Molecolare") {
        if (elemsElectronegativityTable[elemsSymbolsArr[0]]! <=
            elemsElectronegativityTable[elemsSymbolsArr[1]]!) {
          tempCompound.iupacName =
              "${prefixesByCount[elemsIndicesArr[1]]}${elemsNamesRootTable[elemsSymbolsArr[1]]}uro Di ${prefixesByCount[elemsIndicesArr[0]]}${elemsNamesTable[elemsSymbolsArr[0]]}";
        }
        if (elemsElectronegativityTable[elemsSymbolsArr[0]]! >
            elemsElectronegativityTable[elemsSymbolsArr[1]]!) {
          tempCompound.iupacName =
              "${prefixesByCount[elemsIndicesArr[0]]}${elemsNamesRootTable[elemsSymbolsArr[0]]}uro Di ${prefixesByCount[elemsIndicesArr[0]]}${elemsNamesTable[elemsSymbolsArr[1]]}";
        }
      }
    } else if (tempCompound.type == "Ternario") {
      if (tempCompound.category == "Idrossido") {
        if (unordererdElemsCatsArr.toString() == "[M, H, O]") {
          tempCompound.iupacName =
              "${prefixesByCount[elemsIndicesArr[1]]}Idrossido Di ${prefixesByCount[elemsIndicesArr[0]]}${elemsNamesTable[elemsSymbolsArr[0]]}";
        } else if (unordererdElemsCatsArr.toString() == "[M, O, H]") {
          tempCompound.iupacName =
              "${prefixesByCount[elemsIndicesArr[2]]}Idrossido Di ${prefixesByCount[elemsIndicesArr[0]]}${elemsNamesTable[elemsSymbolsArr[0]]}";
        } else if (unordererdElemsCatsArr.toString() == "[H, M, O]") {
          tempCompound.iupacName =
              "${prefixesByCount[elemsIndicesArr[0]]}Idrossido Di ${prefixesByCount[elemsIndicesArr[1]]}${elemsNamesTable[elemsSymbolsArr[1]]}";
        } else if (unordererdElemsCatsArr.toString() == "[H, O, M]") {
          tempCompound.iupacName =
              "${prefixesByCount[elemsIndicesArr[0]]}Idrossido Di ${prefixesByCount[elemsIndicesArr[2]]}${elemsNamesTable[elemsSymbolsArr[2]]}";
        } else if (unordererdElemsCatsArr.toString() == "[O, M, H]") {
          tempCompound.iupacName =
              "${prefixesByCount[elemsIndicesArr[2]]}Idrossido Di ${prefixesByCount[elemsIndicesArr[1]]}${elemsNamesTable[elemsSymbolsArr[1]]}";
        } else {
          tempCompound.iupacName =
              "${prefixesByCount[elemsIndicesArr[1]]}Idrossido Di ${prefixesByCount[elemsIndicesArr[2]]}${elemsNamesTable[elemsSymbolsArr[2]]}";
        }
      } else if (tempCompound.category == "Ossiacido") {
        if (unordererdElemsCatsArr.toString() == "[N, H, O]") {
          tempCompound.iupacName =
              "Acido ${prefixesByCount[elemsIndicesArr[2]]}osso${prefixesByCount[elemsIndicesArr[0]]}${elemsNamesRootTable[elemsSymbolsArr[0]]}ico ${elemsIndicesArr[0]}";
        } else if (unordererdElemsCatsArr.toString() == "[N, O, H]") {
          tempCompound.iupacName =
              "Acido ${prefixesByCount[elemsIndicesArr[1]]}osso${prefixesByCount[elemsIndicesArr[0]]}${elemsNamesRootTable[elemsSymbolsArr[0]]}ico ${elemsIndicesArr[0]}";
        } else if (unordererdElemsCatsArr.toString() == "[H, N, O]") {
          tempCompound.iupacName =
              "Acido ${prefixesByCount[elemsIndicesArr[2]]}osso${prefixesByCount[elemsIndicesArr[1]]}${elemsNamesRootTable[elemsSymbolsArr[1]]}ico ${elemsIndicesArr[1]}";
        } else if (unordererdElemsCatsArr.toString() == "[H, O, N]") {
          tempCompound.iupacName =
              "Acido ${prefixesByCount[elemsIndicesArr[1]]}osso${prefixesByCount[elemsIndicesArr[2]]}${elemsNamesRootTable[elemsSymbolsArr[2]]}ico ${elemsIndicesArr[2]}";
        } else if (unordererdElemsCatsArr.toString() == "[O, H, N]") {
          tempCompound.iupacName =
              "Acido ${prefixesByCount[elemsIndicesArr[0]]}osso${prefixesByCount[elemsIndicesArr[2]]}${elemsNamesRootTable[elemsSymbolsArr[2]]}ico ${elemsIndicesArr[2]}";
        } else {
          tempCompound.iupacName =
              "Acido ${prefixesByCount[elemsIndicesArr[0]]}osso${prefixesByCount[elemsIndicesArr[1]]}${elemsNamesRootTable[elemsSymbolsArr[1]]}ico ${elemsIndicesArr[1]}";
        }
      }
    }

    if (tempCompound.iupacName.isEmpty) {
      tempCompound.iupacName = "Sconosciuto";
      return copy(tempCompound, compound);
    }

    copy(tempCompound, compound);
  }
}
