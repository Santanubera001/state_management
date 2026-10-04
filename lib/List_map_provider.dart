import 'package:flutter/foundation.dart';

class ListMapProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _mData = [];

  //event for Add
  void addData(Map<String, dynamic> data) {
    _mData.add(data);
    notifyListeners();
  }
  void updateData(Map<String,dynamic>updateData,int index){
    _mData[index]=updateData;
    notifyListeners();
  }
  void deleteData(int index){
    _mData.removeAt(index);
    notifyListeners();
  }

  //Event for fetch data

  List<Map<String, dynamic>> getData() => _mData;
}
