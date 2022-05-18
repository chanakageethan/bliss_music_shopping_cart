

import 'package:bliss_music_shopping_cart/UI/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CommonFunctions{


  static  Color getColorByCategory(String category){
    late Color color ;
    switch(category){
      case "guitar":
        color =  AppColors.guitar;
        break;
      case "piano":
        color =  AppColors.piano;
        break;
      case "drums":
        color =  AppColors.drums;
        break;
    }
    return color;
  }


}