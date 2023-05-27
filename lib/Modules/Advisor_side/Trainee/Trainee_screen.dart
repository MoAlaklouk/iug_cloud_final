import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:web_test/Helpers/assets_color.dart';
import 'package:web_test/Helpers/style_manager.dart';

import 'Trainee_controller.dart';

class TraineeScreen extends StatelessWidget {
  const TraineeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AdvTraineeController>(
        builder: (controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Traine',
              style: getMediumStyle(
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => Container(
                        padding: EdgeInsets.all(16),
                        decoration:
                            BoxDecoration(color: AssetsColors.secondaryColor),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor:
                                  AssetsColors.bgColor.withOpacity(.5),
                              child: SvgPicture.asset(
                                'icons/menu_profile.svg',
                                height: 30,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'name : ' + controller.newsData[index].title!,
                                  style: getMediumStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'email : ' +
                                      controller.newsData[index].email!,
                                  style: getMediumStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              'phone : ' + controller.newsData[index].phone!,
                              style: getMediumStyle(
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              'description : ' +
                                  controller.newsData[index].description!,
                              style: getMediumStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                  itemCount: controller.newsData.length),
            ),
          ],
        ),
      ),
    );
  }
}
