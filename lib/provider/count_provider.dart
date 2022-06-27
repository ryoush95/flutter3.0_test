import 'package:flutter/material.dart';

class CountProvider extends ChangeNotifier{
  int _count = 0;
  int get count => _count;

  void getNum(number) {
    _count = number;
  }

  void plus() {
    _count++;
    notifyListeners();
  }

  void minus() {
    _count--;
    notifyListeners();
  }
}