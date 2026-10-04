import 'package:flutter/material.dart';

class Counter extends ChangeNotifier{
  int _count=0;
  int getCount ()=>_count;
  void incrementCount(){
    _count++;
    notifyListeners();
  }
}