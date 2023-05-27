import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Helpers/assets_color.dart';
import '../../../Helpers/style_manager.dart';
import '../../../widget/my_text_field.dart';
import 'trainers_controller.dart';

class CreateNewsScreen extends StatelessWidget {
  CreateNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<TrainersController>(
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
                                      'Trainer name',
                                      style: getRegularStyle(fontSize: 18.sp),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: MyTextField(
                                      myController:
                                          controller.newsTitelController,
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
                                    child: controller.pickfile == null
                                        ? MyTextField(
                                            isReadOnly: true,
                                            hint: 'Trainer Document',
                                            onTap: () {
                                              controller.pickImage();
                                            })
                                        : Container(
                                            height: 100.h,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                    child: Icon(Icons.image)),
                                                SizedBox(
                                                  width: 20.w,
                                                ),
                                                Expanded(
                                                  flex: 4,
                                                  child: Text(
                                                    controller.fileName!,
                                                    style: getMediumStyle(
                                                        fontSize: 18.sp,
                                                        color: Colors.white),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Expanded(
                                                    child: IconButton(
                                                        onPressed: () {
                                                          controller
                                                              .removeImagePicker();
                                                        },
                                                        icon:
                                                            Icon(Icons.cancel)))
                                              ],
                                            ),
                                          ),
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
                                      'email',
                                      style: getRegularStyle(fontSize: 18.sp),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: MyTextField(
                                      myController: controller.emailController,
                                      textInputType: TextInputType.text,
                                      maxLines: 1,
                                      hint: 'email',
                                    ),
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
                                      'phone',
                                      style: getRegularStyle(fontSize: 18.sp),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: MyTextField(
                                      myController: controller.phoneController,
                                      textInputType: TextInputType.text,
                                      maxLines: 1,
                                      hint: 'phone',
                                    ),
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
                                      myController:
                                          controller.newsDescController,
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
                              onPressed: () {
                                if (controller.pickfile == null) {
                                  controller.sendData(
                                      title:
                                          controller.newsTitelController.text,
                                      description:
                                          controller.newsDescController.text,
                                      imageUrl: '',
                                      email: controller.emailController.text,
                                      phone: controller.phoneController.text);
                                } else {
                                  controller.uploadImage(
                                      title:
                                          controller.newsTitelController.text,
                                      description:
                                          controller.newsDescController.text,
                                      email: controller.emailController.text,
                                      phone: controller.phoneController.text);
                                }
                              },
                              child: Text(
                                'Add',
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
