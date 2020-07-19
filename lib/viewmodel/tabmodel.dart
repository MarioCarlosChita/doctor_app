

import 'dart:ui';

import 'package:doctor_app/ui/colors/colorsUI.dart' as color;
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class TabModel with ChangeNotifier
{

  int _selectedIndex=0;
  Color _unseletedColor =color.unselectedColor;
  Color _selectedColor=color.blueColor;

  int get selectIndex=>_selectedIndex;

  Color get unselectedColor=>_unseletedColor;

  Color get selectedColor=>_selectedColor;

  void onTappedItem(int index){

    _selectedIndex=index;
    notifyListeners();
  }
  

}