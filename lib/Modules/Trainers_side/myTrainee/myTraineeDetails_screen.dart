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
import '../Activitys/controller.dart';

class MyTraineeDetailsScreen extends StatelessWidget {
  MyTraineeDetailsScreen({super.key});
  final gKey = GlobalKey<FormState>();
  TSubject tSubject = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Trainee'),
      ),
      body: GetBuilder<ActivityController>(
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
                                      flex: 2,
                                      child: Text(
                                        'Title : ',
                                        style: getBoldStyle(fontSize: 25.sp),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        '${tSubject.title}',
                                        style: getRegularStyle(fontSize: 20.sp),
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
                                      flex: 2,
                                      child: Text(
                                        'Description ',
                                        style: getBoldStyle(fontSize: 25.sp),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        '${tSubject.des} ',
                                        style: getRegularStyle(fontSize: 20.sp),
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
                                      flex: 2,
                                      child: Text(
                                        'Advisor name ',
                                        style: getBoldStyle(fontSize: 25.sp),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        '${tSubject.advisor} ',
                                        style: getRegularStyle(fontSize: 20.sp),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: GestureDetector(
                                    onTap: () {
                                      showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        //DateTime.now() - not to allow to choose before today.
                                        lastDate: DateTime(2100),
                                      ).then((value) => {
                                            controller.chageDateTime(value),
                                            controller.addMeeting(
                                                tSubject.title, tSubject.des)
                                          });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 80,
                                      width: 180,
                                      decoration: BoxDecoration(
                                          color: Colors.amber,
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  15.r)),
                                      child: Text(
                                        ' metting ',
                                        style: getRegularStyle(
                                            fontSize: 20.sp,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20.w,
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
