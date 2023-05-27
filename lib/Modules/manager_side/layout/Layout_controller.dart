import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:web_test/Modules/manager_side/Advisor/advisor_screen.dart';

import '../Home/home_screen.dart';
import '../../Advisor_side/SendEmail/sendEmail_screen.dart';
import '../change_password/change_password_screen.dart';
import '../trainers/create_trainers_screen.dart';
import '../trainers/trainers_screen.dart';
import '../trainers/trainingRequests/trainingRequests_screen.dart';

class LayoutController extends GetxController {
  Widget page = HomeScreen();

  Widget getlayoutpage(PAGES pages) {
    switch (pages) {
      case PAGES.HOME:
        page = HomeScreen();
        break;
      case PAGES.NEWS:
        page = TrainersScreen();
        break;
      case PAGES.CREATENEWS:
        page = CreateNewsScreen();
        break;
      case PAGES.CHANGEPASSWORD:
        page = ChangePasswordScreen();
        break;

      case PAGES.trainingRequests:
        page = TrainingRequestsScreen();
        break;
      case PAGES.AdvisorScreen:
        page = AdvisorScreen();
        break;
      case PAGES.sendEmail:
        page = SendEmailScreen();
        // TODO: Handle this case.
        break;
    }
    update();

    return page;
  }
}

enum PAGES {
  HOME,
  NEWS,
  CREATENEWS,
  CHANGEPASSWORD,
  trainingRequests,
  AdvisorScreen,
  sendEmail
}
