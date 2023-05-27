import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:web_test/Modules/manager_side/Advisor/advisor_screen.dart';
import 'package:web_test/Modules/Trainers_side/Activitys/activity_screen.dart';

import '../Home/HomeScreen.dart';
import '../myTrainee/myTrainee_screen.dart';

class TrLayoutController extends GetxController {
  Widget page = TrHomeScreen();

  Widget getlayoutpage(PAGES pages) {
    switch (pages) {
      case PAGES.HOME:
        page = TrHomeScreen();
        break;

      case PAGES.activity:
        page = ActivityScreen();
        break;
      case PAGES.MyTraineeScreen:
        page = MyTraineeScreen();

        // TODO: Handle this case.
        break;
    }
    update();

    return page;
  }
}

enum PAGES { HOME, activity, MyTraineeScreen }
