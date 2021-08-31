import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/Year11ClassC.dart';
import '../notifier/year_11_class_c_notifier.dart';

getYear11ClassC(Year11ClassCNotifier year11ClassCNotifier) async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('Year11ClassCStudents')
      .orderBy('name')
      .get();

  List<Year11ClassC> _year11ClassCList = [];

  snapshot.docs.forEach((document) {
    Year11ClassC year11ClassC = Year11ClassC.fromMap(document.data());
    _year11ClassCList.add(year11ClassC);
  });

  year11ClassCNotifier.year11ClassCList = _year11ClassCList;
}
