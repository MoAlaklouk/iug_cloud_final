import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../Helpers/assets_color.dart';
import '../../../../Helpers/style_manager.dart';
import '../edit_trainers.dart';
import 'controller.dart';

class TrainingRequestsScreen extends StatelessWidget {
  const TrainingRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<TrainingRequestsController>(
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
                                  "Trainers name",
                                  style: getRegularStyle(fontSize: 20.sp),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  "Request time",
                                  style: getRegularStyle(fontSize: 20.sp),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  "Request description",
                                  style: getRegularStyle(fontSize: 20.sp),
                                ),
                              ),
                              const DataColumn(
                                label: Text(""),
                              ),
                              const DataColumn(
                                label: Text(""),
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
                                      controller.newsData[index].date ?? '',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis)),
                                  DataCell(Text(
                                      controller.newsData[index].description ??
                                          '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis)),
                                  DataCell(TextButton(
                                    onPressed: () {
                                      Get.to(() => EditNewsScreen(),
                                          arguments: index);
                                    },
                                    child: Text(
                                      'accept',
                                      style: getRegularStyle(
                                          fontSize: 18.sp, color: Colors.green),
                                    ),
                                  )),
                                  DataCell(
                                    TextButton(
                                      onPressed: () {
                                        // controller.deleteFormFirebase(
                                        //     controller.key[index], index);
                                      },
                                      child: Text(
                                        'remove',
                                        style: getRegularStyle(
                                            fontSize: 18.sp, color: Colors.red),
                                      ),
                                    ),
                                  )
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
