import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_test/Helpers/style_manager.dart';

import 'assets_color.dart';

class ThemeManager {
  static ThemeData appTheme = ThemeData.dark().copyWith(
      // useMaterial3: true,
      scaffoldBackgroundColor: AssetsColors.bgColor,
      canvasColor: AssetsColors.secondaryColor,
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: getRegularStyle(color: Colors.white30, fontSize: 18.sp),
          errorStyle: getMediumStyle(color: Colors.red)));
}
