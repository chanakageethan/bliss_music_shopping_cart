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

  makeFavoriteItem(String  id){
    for (var element in _instrumentList) {
      if(  element.id == id){
        element.isFavorite = !element.isFavorite;
        notifyListeners();
      }
    }
    // notifyListeners();
  }

  bool getIsFavorite(String  id){
    bool isFavorite = false;
    for (var element in _instrumentList) {
      if(  element.id == id){
        isFavorite =   element.isFavorite;
      }
    }
    return isFavorite;
  }


  filterByModel(String model){
    _filteredList= [];
    _filteredList = _instrumentList.where((i) => i.model.trim() == model.trim() ).toList();
    notifyListeners();
  }






}

