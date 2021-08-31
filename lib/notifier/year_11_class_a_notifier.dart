
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../model/Year11ClassA.dart';

class Year11ClassANotifier with ChangeNotifier {
  List<Year11ClassA> _year11ClassAList = [];
  Year11ClassA _currentYear11ClassA;

  UnmodifiableListView<Year11ClassA> get year11ClassAList => UnmodifiableListView(_year11ClassAList);

  Year11ClassA get currentYear11ClassA => _currentYear11ClassA;

  set year11ClassAList(List<Year11ClassA> year11ClassAList) {
    _year11ClassAList = year11ClassAList;
    notifyListeners();
  }

  set currentYear11ClassA(Year11ClassA year11ClassA) {
    _currentYear11ClassA = year11ClassA;
    notifyListeners();
  }

}