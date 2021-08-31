
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../model/Year11ClassB.dart';

class Year11ClassBNotifier with ChangeNotifier {
  List<Year11ClassB> _year11ClassBList = [];
  Year11ClassB _currentYear11ClassB;

  UnmodifiableListView<Year11ClassB> get year11ClassBList => UnmodifiableListView(_year11ClassBList);

  Year11ClassB get currentYear11ClassB => _currentYear11ClassB;

  set year11ClassBList(List<Year11ClassB> year11ClassBList) {
    _year11ClassBList = year11ClassBList;
    notifyListeners();
  }

  set currentYear11ClassB(Year11ClassB year11ClassB) {
    _currentYear11ClassB = year11ClassB;
    notifyListeners();
  }

}