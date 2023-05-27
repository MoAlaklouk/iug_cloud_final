import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:web_test/Helpers/assets_color.dart';
import 'package:web_test/Helpers/style_manager.dart';
import 'package:web_test/Model/TSubject.dart';
import 'package:web_test/Modules/Trainers_side/Home/home_controller.dart';

import '../addSubject/addSubject_screen.dart';
import '../myTrainee/myTraineeDetails_screen.dart';

class TrHomeScreen extends StatelessWidget {
  const TrHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<TrHomeController>(
        builder: (controller) => ListView(
          children: [
            Text(
              'My Trainee',
              style: getBoldStyle(fontSize: 40),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 400,
              child: ListView.separated(
                shrinkWrap: true,

                // physics: NeverScrollableScrollPhysics(),
                itemCount: controller.myTData.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    childItem(controller.myTData[index], isMy: true),
                separatorBuilder: (context, index) => SizedBox(
                  width: 20,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Suggest for you',
              style: getBoldStyle(fontSize: 40),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 400,
              child: ListView.separated(
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                itemCount: controller.formyData.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    childItem(controller.formyData[index]),
                separatorBuilder: (context, index) => SizedBox(
                  width: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  childItem(TSubject tSubject, {isMy = false}) {
    return Container(
      height: 400,
      width: 500,
      decoration: BoxDecoration(
          color: AssetsColors.secondaryColor,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage('${tSubject.image}'),
                    fit: BoxFit.cover)),
            padding: EdgeInsets.all(16.w),
          )),
          Expanded(
              child: Container(
            alignment: AlignmentDirectional.centerStart,
            padding: EdgeInsets.all(16.w),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'title : ${tSubject.title}',
                    style: getBoldStyle(fontSize: 20),
                  ),
                  Text(
                    'Description : ${tSubject.des}',
                    style: getMediumStyle(fontSize: 15),
                  ),
                  isMy
                      ? Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: GestureDetector(
                            onTap: () =>
                                {Get.to(() => MyTraineeDetailsScreen(),arguments: tSubject)},
                            child: Container(
                              width: 100,
                              alignment: AlignmentDirectional.center,
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  color: Colors.amber[900],
                                  borderRadius: BorderRadius.circular(16.r)),
                              child: Text('show'),
                            ),
                          ),
                        )
                      : Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: GestureDetector(
                            onTap: () => Get.to(() => AddTraineeScreen(),
                                arguments: tSubject),
                            child: Container(
                              width: 100,
                              alignment: AlignmentDirectional.center,
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  color: AssetsColors.primaryColor,
                                  borderRadius: BorderRadius.circular(16.r)),
                              child: Text('Add'),
                            ),
                          ),
                        )
                ]),
          )),
        ],
      ),
    );
  }
}
