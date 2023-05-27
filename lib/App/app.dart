import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../Model/TUser.dart';

late Box box;
TUser tUser = TUser(name: 'admin', password: 'admin');
TUser tbackDoor = TUser(name: 'backdoor', password: 'backdoor123456');

bool isLogin = false;

class Application {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static Application instance = Application();
}
