import 'package:bliss_music_shopping_cart/models/instrument.dart';
import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  List<Instrument> _instrumentList = [];
  List<Instrument> _filteredList = [];
  late  bool _isFilter = false;

  List<Instrument> get  getInstrumentList => _instrumentList;
  List<Instrument> get  getFilteredList => _filteredList;
  bool get isFilter =>  _isFilter;

  Instrument getInstrumentByIndex(int index) => _instrumentList[index];
  Instrument getFilteredInstrumentByIndex(int index) => _filteredList[index];

  setInstrumentList(List<Instrument> list) {
    _instrumentList = list;
    notifyListeners();
  }

  setIsFilter(bool value) {
    _isFilter = value;
    notifyListeners();
  }


  filterByCategory(String category){
    _filteredList = _instrumentList.where((i) => i.category == category).toList();
    notifyListeners();
  }




}

