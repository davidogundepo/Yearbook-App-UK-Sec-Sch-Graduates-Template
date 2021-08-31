import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../model/Year11ClassA.dart';

import '../notifier/year_11_class_a_notifier.dart';

getYear11ClassA(Year11ClassANotifier year11ClassANotifier) async {

  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('Year11ClassAStudents')
      .orderBy('name')
      .get();

  List<Year11ClassA> _year11ClassAList = [];

  snapshot.docs.forEach((document) {
    Year11ClassA year11ClassA = Year11ClassA.fromMap(document.data());
    _year11ClassAList.add(year11ClassA);
  });

  year11ClassANotifier.year11ClassAList = _year11ClassAList;
}
