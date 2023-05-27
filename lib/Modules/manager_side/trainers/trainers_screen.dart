// ignore_for_file: prefer_const_constructors

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../Helpers/assets_color.dart';
import '../../../Helpers/style_manager.dart';
import 'edit_trainers.dart';
import 'trainers_controller.dart';

class TrainersScreen extends StatelessWidget {
  const TrainersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<TrainersController>(
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
                                  "Trainers email",
                                  style: getRegularStyle(fontSize: 20.sp),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  "Trainers phone",
                                  style: getRegularStyle(fontSize: 20.sp),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  "Trainers register time",
                                  style: getRegularStyle(fontSize: 20.sp),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  "Trainers description",
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
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                                  DataCell(Text(
                                    controller.newsData[index].email ?? '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                                  DataCell(Text(
                                    controller.newsData[index].phone ?? '',
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
                                      'Edit',
                                      style: getRegularStyle(
                                          fontSize: 18.sp, color: Colors.green),
                                    ),
                                  )),
                                  DataCell(
                                    TextButton(
                                      onPressed: () {
                                        controller.deleteFormFirebase(
                                            controller.key[index], index);
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
