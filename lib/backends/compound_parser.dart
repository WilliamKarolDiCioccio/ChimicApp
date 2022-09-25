// This file defines the compound parser class and it's interface

import 'package:chimicapp/providers/compound.dart';
import 'package:chimicapp/backends/tables.dart';

class CompoundParser {
  // Beginning of interface

  // Resets all of the compound's properties
  void reset(Compound compound) {
    compound.formula = "";
    compound.iupacName = "";
    compound.standardName = "";
    compound.type = "";
    compound.category = "";
  }

  // Copies the properties from the first compound in the second
  void copy(Compound compound1, Compound compound2) {
    compound2.formula = compound1.formula;
    compound2.iupacName = compound1.iupacName;
    compound2.standardName = compound1.standardName;
    compound2.type = compound1.type;
    compound2.category = compound1.category;
  }

  // Calls the '_update(compound)' private method
  Future<void> update(Compound compound) => _update(compound);

  // Ending of interface

  // Private methods and members

  String _compoundType(int length) {
    if (length == 3) {
      return "Ternario";
    } else if (length == 2) {
      return "Binario";
    } else if (length == 1) {
      return "Non è un composto";
    }
    return "";
  }

  // Updates all the properties of the given compound
  Future<void> _update(Compound compound) async {
    if (compound.formula.isEmpty) {
      () {
        return reset(compound);
      };
    }

    // Temporary compound buffer to avoid lazy outputs
    Compound tempCompound = Compound();
    copy(compound, tempCompound);

    _end() => copy(tempCompound, compound);

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
        return _end();
      }
      elemsArr.add(tmp);
    }

    if (_compoundType(elemsGroupsArr.length).isEmpty) {
      tempCompound.type = "Sconosciuto";
      tempCompound.category = "Indeterminabile";
      tempCompound.iupacName = "Indeterminabile";
      return _end();
    }
    tempCompound.type = _compoundType(elemsGroupsArr.length);

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
      return _end();
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
      //
      if (tempCompound.category == "Ossido Basico" ||
          tempCompound.category == "Ossido Acido" ||
          tempCompound.category == "Ossido") {
        if (unordererdElemsCatsArr.toString() == "[M, O]" ||
            unordererdElemsCatsArr.toString() == "[N, O]") {
          // IUPAC name
          tempCompound.iupacName =
              "${prefixesByCount[elemsIndicesArr[1]]}Ossido Di ${prefixesByCount[elemsIndicesArr[0]]}${elemsNamesTable[elemsSymbolsArr[0]]}";
        } else {
          // IUPAC name
          tempCompound.iupacName =
              "${prefixesByCount[elemsIndicesArr[0]]}Ossido Di ${prefixesByCount[elemsIndicesArr[1]]}${elemsNamesTable[elemsSymbolsArr[1]]}";
        }
        //
        //
      } else if (tempCompound.category == "Idruro") {
        if (unordererdElemsCatsArr.toString() == "[M, H]") {
          // IUPAC name
          tempCompound.iupacName =
              "${prefixesByCount[elemsIndicesArr[1]]}Idruro Di ${prefixesByCount[elemsIndicesArr[0]]}${elemsNamesTable[elemsSymbolsArr[0]]}";
        } else {
          // IUPAC name
          tempCompound.iupacName =
              "${prefixesByCount[elemsIndicesArr[0]]}Idruro Di ${prefixesByCount[elemsIndicesArr[1]]}${elemsNamesTable[elemsSymbolsArr[1]]}";
        }
        //
        //
      } else if (tempCompound.category == "Idracido") {
        if (unordererdElemsCatsArr.toString() == "[N, H]") {
          // IUPAC name
          tempCompound.iupacName =
              "${elemsNamesRootTable[elemsSymbolsArr[0]]}uro di ${prefixesByCount[elemsIndicesArr[1]]}Idrogeno";
          // Standard name
          tempCompound.standardName =
              "Acido ${elemsNamesRootTable[elemsSymbolsArr[0]]}idrico";
        } else {
          // IUPAC name
          tempCompound.iupacName =
              "${elemsNamesRootTable[elemsSymbolsArr[1]]}uro di ${prefixesByCount[elemsIndicesArr[0]]}Idrogeno";
          // Standard name
          tempCompound.standardName =
              "Acido ${elemsNamesRootTable[elemsSymbolsArr[1]]}idrico";
        }
        //
        //
      } else if (tempCompound.category == "Sale") {
        if (unordererdElemsCatsArr.toString() == "[M, N]") {
          // IUPAC name
          tempCompound.iupacName =
              "${prefixesByCount[elemsIndicesArr[1]]}${elemsNamesRootTable[elemsSymbolsArr[1]]}uro Di ${prefixesByCount[elemsIndicesArr[0]]}${elemsNamesTable[elemsSymbolsArr[0]]}";
        } else {
          // IUPAC name
          tempCompound.iupacName =
              "${prefixesByCount[elemsIndicesArr[0]]}${elemsNamesRootTable[elemsSymbolsArr[0]]}uro Di ${prefixesByCount[elemsIndicesArr[1]]}${elemsNamesTable[elemsSymbolsArr[1]]}";
        }
        //
        //
      } else if (tempCompound.category == "Composto Molecolare") {
        if (elemsElectronegativityTable[elemsSymbolsArr[0]]! <=
            elemsElectronegativityTable[elemsSymbolsArr[1]]!) {
          // IUPAC name
          tempCompound.iupacName =
              "${prefixesByCount[elemsIndicesArr[1]]}${elemsNamesRootTable[elemsSymbolsArr[1]]}uro Di ${prefixesByCount[elemsIndicesArr[0]]}${elemsNamesTable[elemsSymbolsArr[0]]}";
        }
        if (elemsElectronegativityTable[elemsSymbolsArr[0]]! >
            elemsElectronegativityTable[elemsSymbolsArr[1]]!) {
          // IUPAC name
          tempCompound.iupacName =
              "${prefixesByCount[elemsIndicesArr[0]]}${elemsNamesRootTable[elemsSymbolsArr[0]]}uro Di ${prefixesByCount[elemsIndicesArr[0]]}${elemsNamesTable[elemsSymbolsArr[1]]}";
        }
        //
        //
      }
    } else if (tempCompound.type == "Ternario") {
      if (tempCompound.category == "Idrossido") {
        if (unordererdElemsCatsArr.toString() == "[M, H, O]") {
          // IUPAC name
          tempCompound.iupacName =
              "${prefixesByCount[elemsIndicesArr[1]]}Idrossido Di ${prefixesByCount[elemsIndicesArr[0]]}${elemsNamesTable[elemsSymbolsArr[0]]}";
        } else if (unordererdElemsCatsArr.toString() == "[M, O, H]") {
          // IUPAC name
          tempCompound.iupacName =
              "${prefixesByCount[elemsIndicesArr[2]]}Idrossido Di ${prefixesByCount[elemsIndicesArr[0]]}${elemsNamesTable[elemsSymbolsArr[0]]}";
        } else if (unordererdElemsCatsArr.toString() == "[H, M, O]") {
          // IUPAC name
          tempCompound.iupacName =
              "${prefixesByCount[elemsIndicesArr[0]]}Idrossido Di ${prefixesByCount[elemsIndicesArr[1]]}${elemsNamesTable[elemsSymbolsArr[1]]}";
        } else if (unordererdElemsCatsArr.toString() == "[H, O, M]") {
          // IUPAC name
          tempCompound.iupacName =
              "${prefixesByCount[elemsIndicesArr[0]]}Idrossido Di ${prefixesByCount[elemsIndicesArr[2]]}${elemsNamesTable[elemsSymbolsArr[2]]}";
        } else if (unordererdElemsCatsArr.toString() == "[O, M, H]") {
          // IUPAC name
          tempCompound.iupacName =
              "${prefixesByCount[elemsIndicesArr[2]]}Idrossido Di ${prefixesByCount[elemsIndicesArr[1]]}${elemsNamesTable[elemsSymbolsArr[1]]}";
        } else {
          // IUPAC name
          tempCompound.iupacName =
              "${prefixesByCount[elemsIndicesArr[1]]}Idrossido Di ${prefixesByCount[elemsIndicesArr[2]]}${elemsNamesTable[elemsSymbolsArr[2]]}";
        }
        //
        //
      } else if (tempCompound.category == "Ossiacido") {
        if (unordererdElemsCatsArr.toString() == "[N, H, O]") {
          // IUPAC name
          tempCompound.iupacName =
              "Acido ${prefixesByCount[elemsIndicesArr[2]]}osso${prefixesByCount[elemsIndicesArr[0]]}${elemsNamesRootTable[elemsSymbolsArr[0]]}ico ${elemsIndicesArr[0]}";
        } else if (unordererdElemsCatsArr.toString() == "[N, O, H]") {
          // IUPAC name
          tempCompound.iupacName =
              "Acido ${prefixesByCount[elemsIndicesArr[1]]}osso${prefixesByCount[elemsIndicesArr[0]]}${elemsNamesRootTable[elemsSymbolsArr[0]]}ico ${elemsIndicesArr[0]}";
        } else if (unordererdElemsCatsArr.toString() == "[H, N, O]") {
          // IUPAC name
          tempCompound.iupacName =
              "Acido ${prefixesByCount[elemsIndicesArr[2]]}osso${prefixesByCount[elemsIndicesArr[1]]}${elemsNamesRootTable[elemsSymbolsArr[1]]}ico ${elemsIndicesArr[1]}";
        } else if (unordererdElemsCatsArr.toString() == "[H, O, N]") {
          // IUPAC name
          tempCompound.iupacName =
              "Acido ${prefixesByCount[elemsIndicesArr[1]]}osso${prefixesByCount[elemsIndicesArr[2]]}${elemsNamesRootTable[elemsSymbolsArr[2]]}ico ${elemsIndicesArr[2]}";
        } else if (unordererdElemsCatsArr.toString() == "[O, H, N]") {
          // IUPAC name
          tempCompound.iupacName =
              "Acido ${prefixesByCount[elemsIndicesArr[0]]}osso${prefixesByCount[elemsIndicesArr[2]]}${elemsNamesRootTable[elemsSymbolsArr[2]]}ico ${elemsIndicesArr[2]}";
        } else {
          // IUPAC name
          tempCompound.iupacName =
              "Acido ${prefixesByCount[elemsIndicesArr[0]]}osso${prefixesByCount[elemsIndicesArr[1]]}${elemsNamesRootTable[elemsSymbolsArr[1]]}ico ${elemsIndicesArr[1]}";
        }
        //
        //
      }
    }

    if (tempCompound.standardName.isEmpty) {
      tempCompound.standardName = "Sconosciuto";
    }
    if (tempCompound.iupacName.isEmpty) {
      tempCompound.iupacName = "Sconosciuto";
    }

    return _end();
  }
}
