import 'package:flutter/material.dart';

class BottomNaviProvider extends ChangeNotifier{
  int _index = 0;
  int get current => _index;

  updatePage(int index){
    _index = index;
    notifyListeners();
  }
}