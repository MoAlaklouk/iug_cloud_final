import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:web_test/Utils/validator.dart';

import '../../../../Helpers/assets_color.dart';
import '../../../../Helpers/style_manager.dart';
import '../../../../widget/my_text_field.dart';
import '../login_controller.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<LoginController>(
          builder: (controller) => Form(
            key: formKey,
            child: Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Image.asset(
                    "icons/bg.jpg",
                    fit: BoxFit.cover,
                    opacity: const AlwaysStoppedAnimation(.1),
                  ),
                ),
                Center(
                    child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsetsDirectional.all(20.w),
                        width: 800.w,
                        margin: EdgeInsets.symmetric(vertical: 40),
                        decoration: BoxDecoration(
                          color: AssetsColors.secondaryColor,
                          borderRadius: BorderRadiusDirectional.circular(16.r),
                        ),
                        child: DefaultTabController(
                          length: 2,
                          child: Column(
                            children: [
                              TabBar(
                                tabs: [
                                  Tab(text: 'Trainee'),
                                  Tab(text: 'Advisor'),
                                ],
                              ),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    registerBody(controller, false, formKey),
                                    registerBody(controller, true, formKey),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }

  registerBody(
      LoginController controller, bool isAdvisor, GlobalKey<FormState> gkey) {
    return Container(
      width: 700.w,
      decoration: BoxDecoration(
          color: AssetsColors.secondaryColor,
          borderRadius: BorderRadiusDirectional.circular(15.r)),
      child: ListView(
        padding: EdgeInsets.all(30.0.w),
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  isAdvisor ? 'Advisor name' : 'Trainer name',
                  style: getRegularStyle(fontSize: 18.sp),
                ),
              ),
              Expanded(
                flex: 3,
                child: MyTextField(
                  textValidType: TEXT_VALID_TYPE.GENERAL,
                  myController: controller.nameController,
                  hint: isAdvisor ? 'Advisor name' : 'Trainer name',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40.h,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  isAdvisor ? 'Advisor Document' : 'Trainer Document',
                  style: getRegularStyle(fontSize: 18.sp),
                ),
              ),
              Expanded(
                flex: 3,
                child: controller.pickfile == null
                    ? MyTextField(
                        textValidType: TEXT_VALID_TYPE.GENERAL,
                        isReadOnly: true,
                        hint:
                            isAdvisor ? 'Advisor Document' : 'Trainer Document',
                        onTap: () {
                          controller.pickImage();
                        })
                    : Container(
                        height: 100.h,
                        child: Row(
                          children: [
                            Expanded(child: Icon(Icons.image)),
                            SizedBox(
                              width: 20.w,
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                controller.fileName!,
                                style: getMediumStyle(
                                    fontSize: 18.sp, color: Colors.white),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Expanded(
                                child: IconButton(
                                    onPressed: () {
                                      controller.removeImagePicker();
                                    },
                                    icon: Icon(Icons.cancel)))
                          ],
                        ),
                      ),
              ),
            ],
          ),
          SizedBox(
            height: 40.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'email',
                  style: getRegularStyle(fontSize: 18.sp),
                ),
              ),
              Expanded(
                flex: 3,
                child: MyTextField(
                  textValidType: TEXT_VALID_TYPE.EMAIL,
                  myController: controller.emailController,
                  textInputType: TextInputType.text,
                  maxLines: 1,
                  hint: 'email',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'password',
                  style: getRegularStyle(fontSize: 18.sp),
                ),
              ),
              Expanded(
                flex: 3,
                child: MyTextField(
                  textValidType: TEXT_VALID_TYPE.GENERAL,
                  myController: controller.passwordController,
                  textInputType: TextInputType.text,
                  isPassword: true,
                  maxLines: 1,
                  hint: 'password',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'phone',
                  style: getRegularStyle(fontSize: 18.sp),
                ),
              ),
              Expanded(
                flex: 3,
                child: MyTextField(
                  textValidType: TEXT_VALID_TYPE.GENERAL,
                  myController: controller.phoneController,
                  textInputType: TextInputType.text,
                  maxLines: 1,
                  hint: 'phone',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  isAdvisor ? 'specialist' : 'short description',
                  style: getRegularStyle(fontSize: 18.sp),
                ),
              ),
              Expanded(
                flex: 3,
                child: MyTextField(
                  textValidType: TEXT_VALID_TYPE.GENERAL,
                  myController: controller.descController,
                  textInputType: TextInputType.text,
                  maxLines: isAdvisor ? 1 : 6,
                  hint: isAdvisor ? 'specialist' : 'short description',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
                onPressed: () async {
                  if (gkey.currentState!.validate()) {
                    if (!isAdvisor) {
                      controller.registerTr(
                          title: controller.nameController.text,
                          description: controller.descController.text,
                          email: controller.emailController.text,
                          phone: controller.phoneController.text,
                          imageUrl: controller.fileName!);
                    } else {
                      controller.registerAdv(
                          title: controller.nameController.text,
                          description: controller.descController.text,
                          email: controller.emailController.text,
                          phone: controller.phoneController.text,
                          imageUrl: controller.fileName!);
                    }
                  }
                },
                child: Text(
                  'Register Now!',
                  style: getMediumStyle(fontSize: 20.sp),
                ),
                style: TextButton.styleFrom(
                    minimumSize: Size(350.w, 80.h),
                    textStyle: getRegularStyle())),
          ),
        ],
      ),
    );
  }
}
