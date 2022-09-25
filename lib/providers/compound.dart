import 'package:flutter/material.dart';

class Compound {
  String formula = "";
  String iupacName = "";
  String standardName = "";
  String type = "";
  String category = "";
}

class CompoundModel extends ChangeNotifier {
  final Compound compoundBuffer = Compound();

  String get iupacName => compoundBuffer.iupacName;
  String get standardName => compoundBuffer.standardName;
  String get type => compoundBuffer.type;
  String get category => compoundBuffer.category;

  void changeDisplayedCompund(Compound compound) {
    compoundBuffer.iupacName = compound.iupacName;
    compoundBuffer.standardName = compound.standardName;
    compoundBuffer.type = compound.type;
    compoundBuffer.category = compound.category;
    notifyListeners();
  }
}
