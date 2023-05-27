import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:web_test/Helpers/assets_color.dart';
import 'package:web_test/widget/chart.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../Helpers/style_manager.dart';
import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Key('Home');
    return GetBuilder<HomeController>(
      builder: (controller) => Padding(
        padding: EdgeInsets.all(30.0.w),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AssetsColors.secondaryColor,
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0.w),
                  child: DataTable2(
                    columns: [
                      DataColumn(
                        label: Text(
                          "Activity title",
                          style: getRegularStyle(fontSize: 20.sp),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Activity user",
                          style: getRegularStyle(fontSize: 20.sp),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Activity date",
                          style: getRegularStyle(fontSize: 20.sp),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Activity description",
                          style: getRegularStyle(fontSize: 20.sp),
                        ),
                      ),
                    ],
                    rows: List.generate(
                      controller.data.length,
                      (index) => DataRow(
                        cells: [
                          DataCell(Text(
                            controller.data[index].title ?? '',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )),
                          DataCell(Text(controller.data[index].user ?? '',
                              maxLines: 2, overflow: TextOverflow.ellipsis)),
                          DataCell(Text(controller.data[index].time.toString(),
                              maxLines: 1, overflow: TextOverflow.ellipsis)),
                          DataCell(Text(
                              controller.data[index].description ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // margin: EdgeInsets.only(right: 30.w),
                  height: .35.sh,
                  alignment: Alignment.centerRight,
                  child: BarChartSample1(),
                ),
                CircularPercentIndicator(
                  radius: 130.0,
                  animation: true,
                  animationDuration: 1200,
                  lineWidth: 15.0,
                  percent: 0.4,
                  center: new Text(
                    "last 24 hour Activity",
                    style: new TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  backgroundColor: Colors.white,
                  progressColor: AssetsColors.primaryColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
