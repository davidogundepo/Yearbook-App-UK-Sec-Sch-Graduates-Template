import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/Year11ClassB.dart';
import '../notifier/year_11_class_b_notifier.dart';

getYear11ClassB(Year11ClassBNotifier year11ClassBNotifier) async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('Year11ClassBStudents')
      .orderBy('name')
      .get();

  List<Year11ClassB> _year11ClassBList = [];

  snapshot.docs.forEach((document) {
    Year11ClassB year11ClassB = Year11ClassB.fromMap(document.data());
    _year11ClassBList.add(year11ClassB);
  });

  year11ClassBNotifier.year11ClassBList = _year11ClassBList;
}
