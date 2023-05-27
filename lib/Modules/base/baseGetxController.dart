import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../App/app.dart';


class BaseGetxController extends GetxController {
  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  void setLoading(bool show) {
    _isLoading.value = show;
    update();
  }

  void showLoading([String? message]) {
    Get.dialog(
      Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Center(
          child: CircularProgressIndicator(
            color:
                Theme.of(Application.navigatorKey.currentContext!).primaryColor,
          ),
        ),
      ),
    );
  }

  //hide loading
  void hideLoading() {
    // print()
    if (Get.isDialogOpen!) Get.back();
  }
}
