import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Helpers/responsive.dart';
import '../layout/layout_screen.dart';
import '../side_menu.dart/side_menu.dart';

class AdvMainScreen extends StatelessWidget {
  AdvMainScreen({Key? key}) : super(key: key);
  String arg = Get.arguments ?? '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
        children: [
          if (Responsive.isDesktop(context))
            Expanded(
              // default flex = 1
              // and it takes 1/6 part of the screen
              child: AdvSideMenu(),
            ),
          Expanded(
            // It takes 5/6 part of the screen
            flex: 5,
            child: AdvLayoutScreen(userName: 'arg'),
          ),
        ],
      )),
    );
  }
}
