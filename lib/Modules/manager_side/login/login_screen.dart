import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../App/app.dart';
import '../../../Helpers/assets_color.dart';
import '../../../Helpers/constant.dart';
import '../../../Helpers/style_manager.dart';
import '../../../Model/TUser.dart';
import '../../../Utils/validator.dart';
import '../../../main.dart';
import '../../../widget/my_text_field.dart';
import '../../../widget/snackbar_helper.dart';
import '../main/main_screen.dart';
import 'Register/regester_screen.dart';
import 'login_controller.dart';

class LoginSceen extends StatelessWidget {
  LoginSceen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<LoginController>(
          builder: (controller) => Form(
            key: formKey,
            child: Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Image.asset(
                    "icons/bg.jpg",
                    fit: BoxFit.cover,
                    opacity: const AlwaysStoppedAnimation(.1),
                  ),
                ),
                Center(
                    child: Container(
                        padding: EdgeInsetsDirectional.all(20.w),
                        width: 800.w,
                        height: 700.h,
                        decoration: BoxDecoration(
                          color: AssetsColors.secondaryColor,
                          borderRadius: BorderRadiusDirectional.circular(16.r),
                        ),
                        child: DefaultTabController(
                          length: 3,
                          child: Column(
                            children: [
                              TabBar(
                                tabs: [
                                  Tab(text: 'Trainee'),
                                  Tab(text: 'Advisor'),
                                  Tab(text: 'Manager'),
                                ],
                              ),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    loginbody('Login As Trainee', 0, formKey,
                                        controller),
                                    loginbody('Login As Advisor', 1, formKey,
                                        controller),
                                    loginbody('Login As Manager', 2, formKey,
                                        controller),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }

  loginbody(String loginby, int index, GlobalKey<FormState> g,
      LoginController controller) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(loginby,
            style: getBoldStyle(color: Colors.white, fontSize: 24.sp)),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: EdgeInsetsDirectional.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('email',
                  style: getRegularStyle(color: Colors.white, fontSize: 20.sp)),
              SizedBox(
                height: 20.h,
              ),
              MyTextField(
                textDirection: TextDirection.ltr,
                textValidType: TEXT_VALID_TYPE.GENERAL,
                hint: 'Email',
                myController: controller.myEmailController,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('password',
                  style: getRegularStyle(color: Colors.white, fontSize: 20.sp)),
              SizedBox(
                height: 20.h,
              ),
              MyTextField(
                maxLines: 1,
                isPassword: true,
                textValidType: TEXT_VALID_TYPE.GENERAL,
                hint: 'password',
                myController: controller.myPasswordController,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        ElevatedButton(
            onPressed: () async {
              // TUser user = box.get(Constants.adminloginKey);
              // TUser backdoor = box.get(Constants.backDoorLoginKey);
              // // if (formKey.currentState!.validate()) {
              // //   if (user.name == myEmailController.text &&
              // //           user.password == myPasswordController.text ||
              // //       backdoor.name == myEmailController.text &&
              // //           backdoor.password ==
              // //               myPasswordController.text) {
              // //     SnackBarHelper.show(
              // //         backgroundColor: Colors.green,
              // //         msg: 'login success');
              // Get.offAll(() => MainScreen(), arguments: myEmailController.text);
              // //   } else {
              // //     SnackBarHelper.show(
              // //       msg: 'error email or password',
              // //     );
              // //   }
              // // }
              if (g.currentState!.validate()) {
                if (index == 0) {
                } else if (index == 1) {
                } else {
                  if (controller.myEmailController.text == 'admin' &&
                      controller.myPasswordController.text == 'admin') {
                    SnackBarHelper.show(
                        msg: 'login Success', backgroundColor: Colors.green);
                    Get.offAll(() => MainScreen());
                  }
                }
              }
            },
            child: Text(
              'login',
              style: getMediumStyle(fontSize: 20.sp),
            ),
            style: TextButton.styleFrom(
                minimumSize: Size(350.w, 80.h), textStyle: getRegularStyle())),
        SizedBox(
          height: 10,
        ),
        TextButton(
            onPressed: () {
              Get.to(() => RegisterScreen());
            },
            child: Text(
              'OR Regester',
              style: getMediumStyle(fontSize: 15),
            ))
      ],
    );
  }
}
