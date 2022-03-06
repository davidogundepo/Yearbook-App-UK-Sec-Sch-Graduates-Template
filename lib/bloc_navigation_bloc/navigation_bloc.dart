
import 'package:bloc/bloc.dart';
import '../thrown_pages/management_thrown_page.dart';
import '../thrown_pages/teachers_thrown_page.dart';
import '../thrown_pages/year_11a_thrown_page.dart';
import '../thrown_pages/year_11b_thrown_page.dart';
import '../thrown_pages/year_11c_thrown_page.dart';
import '../thrown_pages/prefects_thrown_page.dart';

enum NavigationEvents {
  MyYear11ClassAPageClickedEvent,
  MyYear11ClassBPageClickedEvent,
  MyYear11ClassCPageClickedEvent,
  MyGraduatesClassTeachersPageClickedEvent,
  MyManagementBodyPageClickedEvent,
  MyClassPrefectsPageClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {

  @override
  NavigationStates get initialState => MyYear11ClassAPage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents events) async* {
    switch (events) {
      case NavigationEvents.MyYear11ClassAPageClickedEvent:
        yield MyYear11ClassAPage();
        break;
      case NavigationEvents.MyYear11ClassBPageClickedEvent:
        yield MyYear11ClassBPage();
        break;
      case NavigationEvents.MyYear11ClassCPageClickedEvent:
        yield MyYear11ClassCPage();
        break;
      case NavigationEvents.MyGraduatesClassTeachersPageClickedEvent:
        yield MyGraduatesClassTeachersPage();
        break;
      case NavigationEvents.MyManagementBodyPageClickedEvent:
        yield MyManagementBodyPage();
        break;
      case NavigationEvents.MyClassPrefectsPageClickedEvent:
        yield MyClassPrefectsPage();
        break;
    }
  }


}
