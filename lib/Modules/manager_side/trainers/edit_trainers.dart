import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Helpers/assets_color.dart';
import '../../../Helpers/style_manager.dart';
import '../../../widget/my_text_field.dart';
import 'trainers_controller.dart';

class EditNewsScreen extends StatelessWidget {
  EditNewsScreen({Key? key}) : super(key: key);
  TextEditingController titelController = TextEditingController();
  TextEditingController descController = TextEditingController();
  int arg = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AssetsColors.secondaryColor,
      ),
      body: GetBuilder<TrainersController>(
        builder: (controller) => Container(
          alignment: AlignmentDirectional.centerStart,
          child: Padding(
            padding: EdgeInsetsDirectional.all(50.0.w),
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
                                      'Trainer name',
                                      style: getRegularStyle(fontSize: 18.sp),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: MyTextField(
                                      myController: titelController,
                                      textInputType: TextInputType.text,
                                      hint: 'Trainer name',
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Trainer Document',
                                      style: getRegularStyle(fontSize: 18.sp),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: MyTextField(
                                        hint: 'Trainer Document',
                                        onTap: () {
                                          controller.pickImage();
                                        }),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'short description',
                                      style: getRegularStyle(fontSize: 18.sp),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: MyTextField(
                                      myController: descController,
                                      textInputType: TextInputType.text,
                                      maxLines: 6,
                                      hint: 'short description',
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
                              onPressed: () async {
                                await controller.updataDataFormFirebase(
                                    title: titelController.text,
                                    description: descController.text,
                                    path: arg);
                              },
                              child: Text(
                                'Edit',
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
