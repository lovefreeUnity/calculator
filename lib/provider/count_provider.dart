import 'package:flutter/cupertino.dart';

class CountProvider with ChangeNotifier{
  int _countNumber = 0;
  int get countNumber => _countNumber;

  addEvent(int num){
    _countNumber += num;
    notifyListeners();
  }

  subtractEvent(int num){
    _countNumber -= num;
    notifyListeners();
  }
}