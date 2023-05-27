import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../Helpers/assets_color.dart';
import '../../manager_side/login/login_screen.dart';
import 'Layout_controller.dart';

class TrLayoutScreen extends StatelessWidget {
  String userName;
  TrLayoutScreen({
    Key? key,
    this.userName = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TrLayoutController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 100.h,
          actions: [
            Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.only(left: 16.w),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.w,
                  ),
                  decoration: BoxDecoration(
                    color: AssetsColors.secondaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    border: Border.all(color: Colors.white10),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/profile_pic.png",
                        height: 38.h,
                      ),
                      PopupMenuButton<String>(
                        icon: Icon(Icons.keyboard_arrow_down),
                        onSelected: (String newValue) {
                          switch (newValue) {
                            case 'logout':
                              Get.offAll(() => LoginSceen());
                              break;
                            default:
                          }
                        },
                        itemBuilder: (BuildContext context) =>
                            <String>['logout']
                                .map(
                                  (String value) => PopupMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  ),
                                )
                                .toList(),
                      ),
                    ],
                  ),
                ))
          ],
          elevation: 5,
          shadowColor: Colors.white10,
          backgroundColor: AssetsColors.bgColor,
        ),
        body: Padding(
          padding: const EdgeInsetsDirectional.only(start: 16.0, top: 16),
          child: controller.page,
        ),
      ),
    );
  }
}
