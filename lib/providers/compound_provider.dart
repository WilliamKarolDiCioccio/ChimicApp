import 'package:chimicapp/ccompound.dart';
import 'package:flutter/material.dart';

class CompoundProvider extends ChangeNotifier {
  final CCompound compoundBuffer = CCompound();

  String get iupacName => compoundBuffer.iupacName;
  String get standardName => compoundBuffer.standardName;
  String get type => compoundBuffer.compoundType;
  String get category => compoundBuffer.compoundCatergory;

  void changeDisplayedCompund(CCompound compound) {
    compoundBuffer.iupacName = compound.iupacName;
    compoundBuffer.standardName = compound.standardName;
    compoundBuffer.compoundType = compound.compoundType;
    compoundBuffer.compoundCatergory = compound.compoundCatergory;
    notifyListeners();
  }
}
