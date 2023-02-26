import 'package:flutter/cupertino.dart';

class CountProvider with ChangeNotifier{
  late int _countNumber;
  int get countNumber => _countNumber;

  CountProvider(){
    _countNumber = 0;
  }
  addEvent(int num){
    _countNumber += num;
    notifyListeners();
  }

  subtractEvent(int num){
    _countNumber -= num;
    notifyListeners();
  }
}