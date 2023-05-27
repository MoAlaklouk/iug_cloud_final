import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:web_test/Modules/manager_side/trainers/trainers_controller.dart';

import '../../../App/app.dart';
import '../../../Helpers/assets_color.dart';
import '../../../Helpers/constant.dart';
import '../../../Helpers/style_manager.dart';
import '../../../Model/TUser.dart';
import '../../../Utils/validator.dart';
import '../../../widget/my_text_field.dart';
import '../../../widget/snackbar_helper.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<TrainersController>(
        builder: (controller) => Form(
          key: formKey,
          child: Container(
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
                          width: 1200.w,
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
                                        'كلمة السر الحالية',
                                        style: getRegularStyle(fontSize: 18.sp),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: MyTextField(
                                        textValidType: TEXT_VALID_TYPE.GENERAL,
                                        myController: currentPasswordController,
                                        hint: 'كلمة السر الحالية',
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
                                        'كلمة السر الجديدة',
                                        style: getRegularStyle(fontSize: 18.sp),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: MyTextField(
                                          textValidType:
                                              TEXT_VALID_TYPE.GENERAL,
                                          myController: newPasswordController,
                                          hint: 'كلمة السر الجديدة',
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
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'تأكيد كلمة السر ',
                                        style: getRegularStyle(fontSize: 18.sp),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: MyTextField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return '* الجقل مطلوب';
                                          } else if (confirmNewPasswordController
                                                  .text !=
                                              newPasswordController.text) {
                                            return 'الحقل غير متطابق';
                                          }
                                        },
                                        myController:
                                            confirmNewPasswordController,
                                        hint: 'تأكيد كلمة السر الجديدة',
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
                                  TUser data = box.get(Constants.adminloginKey);
                                  if (formKey.currentState!.validate()) {
                                    if (currentPasswordController.text ==
                                        data.password) {
                                      tUser.password =
                                          newPasswordController.text;
                                      await tUser.save();
                                      SnackBarHelper.show(
                                          backgroundColor: Colors.green,
                                          msg: 'تم تغير كلمة السر');
                                    } else {
                                      SnackBarHelper.show(
                                          msg: 'كلمة السر غير صحيحة');
                                    }
                                  }
                                },
                                child: Text(
                                  'حفظ',
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
      ),
    );
  }
}
