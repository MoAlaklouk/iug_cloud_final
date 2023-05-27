import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:web_test/Modules/Advisor_side/SendEmail/sendEmail_controller.dart';

import '../../../Helpers/assets_color.dart';
import '../../../Helpers/style_manager.dart';
import '../../../widget/my_text_field.dart';
import '../../manager_side/trainers/trainers_controller.dart';

class SendEmailScreen extends StatelessWidget {
  const SendEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SendEmailController>(
        builder: (controller) => Container(
          alignment: AlignmentDirectional.centerStart,
          child: Padding(
            padding: EdgeInsetsDirectional.all(30.0.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 700.w,
                        decoration: BoxDecoration(
                            color: AssetsColors.secondaryColor,
                            borderRadius:
                                BorderRadiusDirectional.circular(15.r)),
                        child: Padding(
                          padding: EdgeInsets.all(30.0.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'email ',
                                      style: getRegularStyle(fontSize: 18.sp),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: MyTextField(
                                      myController: controller.emailcontrller,
                                      hint: 'email',
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'body',
                                      style: getRegularStyle(fontSize: 18.sp),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: MyTextField(
                                      maxLines: 7,
                                      myController:
                                          controller.passwordcontrller,
                                      hint: 'body',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: AssetsColors.secondaryColor,
                            borderRadius:
                                BorderRadiusDirectional.circular(15.r)),
                        child: Padding(
                          padding: EdgeInsets.all(30.0.w),
                          child: ElevatedButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 120.w,
                                  vertical: 40.w,
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                'Send',
                                style: getRegularStyle(fontSize: 20.sp),
                              )),
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
