import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../Helpers/style_manager.dart';
import '../layout/Layout_controller.dart';

class SideMenu extends StatelessWidget {
  LayoutController layoutController = Get.find();
  SideMenu({
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
          ExpansionTile(
              leading: SvgPicture.asset(
                "icons/menu_tran.svg",
                color: Colors.white54,
                height: 30.h,
              ),
              title: Text(
                'trainers',
                textAlign: TextAlign.start,
                style: getRegularStyle(fontSize: 20.sp),
              ),
              expandedAlignment: Alignment.centerRight,
              childrenPadding: EdgeInsets.symmetric(horizontal: 16.w),
              children: [
                // ListTile(
                //     onTap: () {
                //       layoutController.getlayoutpage(PAGES.CREATENEWS);
                //     },
                //     leading: Icon(
                //       Icons.add,
                //       color: Colors.white54,
                //     ),
                //     title: Text(
                //       'new trainers',
                //       textAlign: TextAlign.start,
                //       style: getRegularStyle(fontSize: 16.sp),
                //     )),
                ListTile(
                    onTap: () {
                      layoutController.getlayoutpage(PAGES.NEWS);
                    },
                    leading: Icon(
                      Icons.category,
                      color: Colors.white54,
                    ),
                    title: Text(
                      'show trainers',
                      style: getRegularStyle(fontSize: 16.sp),
                    )),
                ListTile(
                    onTap: () {
                      layoutController.getlayoutpage(PAGES.trainingRequests);
                    },
                    leading: Icon(
                      Icons.content_paste_go,
                      color: Colors.white54,
                    ),
                    title: Text(
                      'training requests',
                      style: getRegularStyle(fontSize: 16.sp),
                    )),
              ]),
          ExpansionTile(
              leading: Icon(
                Icons.people,
                color: Colors.white54,
              ),
              title: Text(
                'Advisor',
                textAlign: TextAlign.start,
                style: getRegularStyle(fontSize: 20.sp),
              ),
              expandedAlignment: Alignment.centerRight,
              childrenPadding: EdgeInsets.symmetric(horizontal: 16.w),
              children: [
                ListTile(
                    onTap: () {
                      layoutController.getlayoutpage(PAGES.AdvisorScreen);
                    },
                    leading: Icon(
                      Icons.person,
                      color: Colors.white54,
                    ),
                    title: Text(
                      'show Advisor',
                      textAlign: TextAlign.start,
                      style: getRegularStyle(fontSize: 16.sp),
                    )),
              ]),
          ExpansionTile(
              leading: Icon(
                Icons.settings,
                color: Colors.white54,
              ),
              title: Text(
                'settings',
                textAlign: TextAlign.start,
                style: getRegularStyle(fontSize: 20.sp),
              ),
              expandedAlignment: Alignment.centerRight,
              childrenPadding: EdgeInsets.symmetric(horizontal: 16.w),
              children: [
                ListTile(
                    onTap: () {
                      layoutController.getlayoutpage(PAGES.CHANGEPASSWORD);
                    },
                    leading: Icon(
                      Icons.key,
                      color: Colors.white54,
                    ),
                    title: Text(
                      'change password',
                      textAlign: TextAlign.start,
                      style: getRegularStyle(
                        fontSize: 16.sp,
                      ),
                    )),
              ]),
        ],
      ),
    );
  }
}
