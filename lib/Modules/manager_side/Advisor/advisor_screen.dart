import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:web_test/Modules/manager_side/Advisor/advisor_controller.dart';

import '../../../Helpers/assets_color.dart';
import '../../../Helpers/style_manager.dart';

class AdvisorScreen extends StatelessWidget {
  const AdvisorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AdvisorController>(
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
                    child: controller.isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : DataTable2(
                            minWidth: 600,
                            columns: [
                              DataColumn(
                                label: Text(
                                  "Advisor name",
                                  style: getRegularStyle(fontSize: 20.sp),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  "Advisor email",
                                  style: getRegularStyle(fontSize: 20.sp),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  "Advisor phone",
                                  style: getRegularStyle(fontSize: 20.sp),
                                ),
                              ),
                              const DataColumn(
                                label: Text("Subject"),
                              ),
                              const DataColumn(
                                label: Text("triner Number"),
                              ),
                            ],
                            rows: List.generate(
                              controller.newsData.length,
                              (index) => DataRow(
                                cells: [
                                  DataCell(Text(
                                    controller.newsData[index].name ?? '',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                                  DataCell(Text(
                                      controller.newsData[index].email ?? '',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis)),
                                  DataCell(Text(
                                      controller.newsData[index].phone ?? '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis)),
                                  DataCell(Text(
                                      controller.newsData[index].trainee ?? '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis)),
                                  DataCell(Text(
                                      controller.newsData[index].trinerNum
                                          .toString(),
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
