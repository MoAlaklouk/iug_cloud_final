import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../Helpers/style_manager.dart';
import '../layout/Layout_controller.dart';

class AdvSideMenu extends StatelessWidget {
  AdvLayoutController layoutController = Get.find();
  AdvSideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Align(
                alignment: AlignmentDirectional.center,
                child: Image(
                  image: AssetImage('icons/logo.png'),
                  color: Colors.white,
                )),
          ),
          ListTile(
            onTap: () {
              layoutController.getlayoutpage(PAGES.HOME);
            },
            leading: SvgPicture.asset(
              "icons/menu_dashbord.svg",
              color: Colors.white54,
              height: 30.h,
            ),
            title: Text(
              'home',
              style: getRegularStyle(fontSize: 20.sp),
            ),
          ),
          ListTile(
            onTap: () {
              layoutController.getlayoutpage(PAGES.TraineeScreen);
            },
            leading: SvgPicture.asset(
              "icons/menu_profile.svg",
              color: Colors.white54,
              height: 30.h,
            ),
            title: Text(
              'Trainee ',
              style: getRegularStyle(fontSize: 20.sp),
            ),
          ),
          ListTile(
            onTap: () {
              layoutController.getlayoutpage(PAGES.sendemail);
            },
            leading: SvgPicture.asset(
              "icons/menu_setting.svg",
              color: Colors.white54,
              height: 30.h,
            ),
            title: Text(
              'Send email',
              style: getRegularStyle(fontSize: 20.sp),
            ),
          ),
        ],
      ),
    );
  }
}
