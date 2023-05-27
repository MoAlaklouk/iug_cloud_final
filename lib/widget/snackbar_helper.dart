import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../App/app.dart';
import '../Helpers/style_manager.dart';

class SnackBarHelper {
  // Find the ScaffoldMessenger in the widget tree
  // and use it to show a SnackBar.
  static show({String msg = "قيد التطوير",Color backgroundColor = Colors.red}) {
    ScaffoldMessenger.of(Application.navigatorKey.currentContext!)
        .showSnackBar(SnackBar(
      backgroundColor: backgroundColor,
      content: Text(
        msg,
        style: getRegularStyle(fontSize: 20.sp),
      ),
    ));
  }
}
