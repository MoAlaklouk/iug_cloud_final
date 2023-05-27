import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:web_test/Helpers/assets_color.dart';
import 'package:web_test/Helpers/style_manager.dart';
import 'package:web_test/Modules/Advisor_side/Home/HomeController.dart';
import 'package:web_test/Modules/Advisor_side/Home/HomeController.dart';

class AdvHomeScreen extends StatelessWidget {
  const AdvHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AdvHomeController>(
        builder: (controller) => Padding(
          padding: EdgeInsets.all(30.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " Meeting Request",
                style: getRegularStyle(fontSize: 20.sp),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  color: AssetsColors.secondaryColor,
                  child: Padding(
                    padding: EdgeInsets.all(16.0.w),
                    child: DataTable2(
                      minWidth: 600,
                      columns: [
                        DataColumn(
                          label: Text(
                            " userName",
                            style: getRegularStyle(fontSize: 20.sp),
                          ),
                        ),
                     
                        DataColumn(
                          label: Text(
                            " trinee Title",
                            style: getRegularStyle(fontSize: 20.sp),
                          ),
                        ),
                           DataColumn(
                          label: Text(
                            " Description",
                            style: getRegularStyle(fontSize: 20.sp),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "date",
                            style: getRegularStyle(fontSize: 20.sp),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "",
                            style: getRegularStyle(fontSize: 20.sp),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "",
                            style: getRegularStyle(fontSize: 20.sp),
                          ),
                        ),
                      ],
                      rows: List.generate(
                        controller.newsData.length,
                        (index) => DataRow(
                          cells: [
                            DataCell(Text(
                              controller.newsData[index].userName ?? '',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )),
                            DataCell(Text(
                                controller.newsData[index].trineeTitle ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis)),
                            DataCell(Text(
                                controller.newsData[index].date ?? '',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis)),
                            DataCell(Text(
                                controller.newsData[index].date.toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis)),
                            DataCell(
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'accept',
                                  style: getRegularStyle(
                                      fontSize: 18.sp, color: Colors.green),
                                ),
                              ),
                            ),
                            DataCell(
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'remove',
                                  style: getRegularStyle(
                                      fontSize: 18.sp, color: Colors.red),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
