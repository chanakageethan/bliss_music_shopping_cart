

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/instrument.dart';

class CartProvider extends ChangeNotifier{

   List<Instrument> _cartItemList = [];
   late double totalPrice = 0;


  List<Instrument> get  getCartItemList => _cartItemList;
  Instrument getCartItemByIndex(int index) => _cartItemList[index];

  addToCart(Instrument instrument){
    _cartItemList.add(instrument);
    totalPrice = totalPrice + instrument.price;
    notifyListeners();
  }
}