
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../model/Year11ClassC.dart';

class Year11ClassCNotifier with ChangeNotifier {
  List<Year11ClassC> _year11ClassCList = [];
  Year11ClassC _currentYear11ClassC;

  UnmodifiableListView<Year11ClassC> get year11ClassCList => UnmodifiableListView(_year11ClassCList);

  Year11ClassC get currentYear11ClassC => _currentYear11ClassC;

  set year11ClassCList(List<Year11ClassC> year11ClassCList) {
    _year11ClassCList = year11ClassCList;
    notifyListeners();
  }

  set currentYear11ClassC(Year11ClassC year11ClassC) {
    _currentYear11ClassC = year11ClassC;
    notifyListeners();
  }

}