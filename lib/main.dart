import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:web_test/Modules/Advisor_side/main/main_screen.dart';
import 'package:web_test/Modules/Trainers_side/main/main_screen.dart';
import 'package:web_test/Modules/manager_side/login/login_screen.dart';
import 'package:web_test/Modules/manager_side/main/main_screen.dart';

import 'App/app.dart';
import 'App/binding.dart';
import 'Helpers/constant.dart';
import 'Helpers/theme_manager.dart';
import 'Model/TUser.dart';
import 'Modules/Advisor_side/layout/layout_screen.dart';
import 'Modules/Trainers_side/layout/layout_screen.dart';
import 'Utils/firebase.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.web,
  );
  await FirebaseUtiles.init();
  await Hive.initFlutter();
  Hive.registerAdapter(TUserAdapter());

  box = await Hive.openBox('box');
  if (box.get(Constants.adminloginKey) == null) {
    box.put(Constants.adminloginKey, tUser);
  }
  if (box.get(Constants.backDoorLoginKey) == null) {
    box.put(Constants.backDoorLoginKey, tbackDoor);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      builder: (context, child) => GetMaterialApp(
        initialBinding: Binding(),
        // localizationsDelegates: AppLocalization.localizationsDelegates,
        locale: const Locale('en'),
        navigatorKey: Application.navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeManager.appTheme,

        home: LoginSceen(),
      ),
    );
  }
}
