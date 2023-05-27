import 'package:get/get.dart';
import 'package:web_test/Modules/Advisor_side/Home/HomeController.dart';
import 'package:web_test/Modules/Trainers_side/Activitys/controller.dart';
import 'package:web_test/Modules/Trainers_side/layout/Layout_controller.dart';

import '../Modules/Advisor_side/Trainee/Trainee_controller.dart';
import '../Modules/Advisor_side/layout/Layout_controller.dart';
import '../Modules/Trainers_side/Home/home_controller.dart';
import '../Modules/Trainers_side/addSubject/addSubject_controller.dart';
import '../Modules/manager_side/Advisor/advisor_controller.dart';
import '../Modules/manager_side/Home/home_controller.dart';
import '../Modules/Advisor_side/SendEmail/sendEmail_controller.dart';
import '../Modules/manager_side/layout/Layout_controller.dart';
import '../Modules/manager_side/login/login_controller.dart';
import '../Modules/manager_side/trainers/edit_trainers.dart';
import '../Modules/manager_side/trainers/trainers_controller.dart';
import '../Modules/manager_side/trainers/trainingRequests/controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LayoutController(), fenix: true);
    Get.lazyPut(() => TrainersController(), fenix: true);
    Get.lazyPut(() => EditNewsScreen(), fenix: true);
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => TrainingRequestsController(), fenix: true);
    Get.lazyPut(() => AdvisorController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => SendEmailController(), fenix: true);
    Get.lazyPut(() => TrLayoutController(), fenix: true);
    Get.lazyPut(() => AddTraineeController(), fenix: true);
    Get.lazyPut(() => ActivityController(), fenix: true);
    Get.lazyPut(() => AdvLayoutController(), fenix: true);
    Get.lazyPut(() => AdvHomeController(), fenix: true);
    Get.lazyPut(() => AdvTraineeController(), fenix: true);
    Get.lazyPut(() => TrHomeController(), fenix: true);
  }
}
