import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:web_test/Modules/Advisor_side/SendEmail/sendEmail_screen.dart';
import 'package:web_test/Modules/manager_side/Advisor/advisor_screen.dart';
import 'package:web_test/Modules/Trainers_side/Activitys/activity_screen.dart';

import '../Home/HomeScreen.dart';
import '../Trainee/Trainee_screen.dart';

class AdvLayoutController extends GetxController {
  Widget page = AdvHomeScreen();

  Widget getlayoutpage(PAGES pages) {
    switch (pages) {
      case PAGES.HOME:
        page = AdvHomeScreen();
        break;

      case PAGES.TraineeScreen:
        page = TraineeScreen();

        // TODO: Handle this case.
        break;
      case PAGES.sendemail:
        page = SendEmailScreen();

        // TODO: Handle this case.
        break;
    }
    update();

    return page;
  }
}

enum PAGES { HOME, TraineeScreen, sendemail }
