import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:web_test/Modules/Trainers_side/Activitys/controller.dart';

import '../../../Helpers/assets_color.dart';
import '../../../Helpers/style_manager.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ActivityController>(
        builder: (controller) => controller.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: EdgeInsets.all(30.0.w),
                child: Container(
                  color: AssetsColors.secondaryColor,
                  child: Padding(
                    padding: EdgeInsets.all(16.0.w),
                    child: DataTable2(
                      minWidth: 600,
                      columns: [
                        DataColumn(
                          label: Text(
                            " title",
                            style: getRegularStyle(fontSize: 20.sp),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            " description",
                            style: getRegularStyle(fontSize: 20.sp),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            " user",
                            style: getRegularStyle(fontSize: 20.sp),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "time",
                            style: getRegularStyle(fontSize: 20.sp),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "state",
                            style: getRegularStyle(fontSize: 20.sp),
                          ),
                        ),
                      ],
                      rows: List.generate(
                        controller.newsData.length,
                        (index) => DataRow(
                          cells: [
                            DataCell(Text(
                              controller.newsData[index].title ?? '',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )),
                            DataCell(Text(
                                controller.newsData[index].description ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis)),
                            DataCell(Text(controller.newsData[index].user ?? '',
                                maxLines: 1, overflow: TextOverflow.ellipsis)),
                            DataCell(Text(
                                controller.newsData[index].time.toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis)),
                            DataCell(Text(
                                controller.newsData[index].state.toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
