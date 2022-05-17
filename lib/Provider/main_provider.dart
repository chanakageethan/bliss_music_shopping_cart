import 'package:bliss_music_shopping_cart/models/instrument.dart';
import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  List<Instrument> _instrumentList = [];


  List<Instrument> get  getInstrumentList => _instrumentList;

  Instrument getInstrumentByIndex(int index) => _instrumentList[index];

  setInstrumentList(List<Instrument> list) {
    _instrumentList = list;
    notifyListeners();
  }




}

