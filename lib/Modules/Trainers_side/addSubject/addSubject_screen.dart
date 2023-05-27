import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:web_test/Model/TSubject.dart';
import 'package:web_test/Utils/validator.dart';

import '../../../Helpers/assets_color.dart';
import '../../../Helpers/style_manager.dart';
import '../../../widget/my_text_field.dart';
import 'addSubject_controller.dart';

class AddTraineeScreen extends StatelessWidget {
  AddTraineeScreen({super.key});
  final gKey = GlobalKey<FormState>();
  TSubject tSubject = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Trainee'),
      ),
      body: GetBuilder<AddTraineeController>(
        builder: (controller) => Form(
          key: gKey,
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
                                        'Title :  ',
                                        style: getBoldStyle(fontSize: 18.sp),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        '${tSubject.title}',
                                        style: getRegularStyle(fontSize: 16.sp),
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
                                        'Description : ',
                                        style: getBoldStyle(fontSize: 18.sp),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        '${tSubject.des} ',
                                        style: getRegularStyle(fontSize: 16.sp),
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
                                        'Title Add  Request ',
                                        style: getRegularStyle(fontSize: 18.sp),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: MyTextField(
                                        textValidType: TEXT_VALID_TYPE.GENERAL,
                                        myController:
                                            controller.titleController,
                                        hint: 'Request title',
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
                                        ' description',
                                        style: getRegularStyle(fontSize: 18.sp),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: MyTextField(
                                        textValidType: TEXT_VALID_TYPE.GENERAL,
                                        myController: controller.desController,
                                        textInputType: TextInputType.text,
                                        maxLines: 6,
                                        hint: ' description',
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
                          height: 600,
                          width: 500,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage(tSubject.image ??
                                      'https://cdn.w600.comps.canstockphoto.com/todays-lesson-words-on-school-stock-photo_csp7882734.jpg'),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
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
                                  if (gKey.currentState!.validate()) {
                                    controller.addSubject();
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
      ),
    );
  }
}
