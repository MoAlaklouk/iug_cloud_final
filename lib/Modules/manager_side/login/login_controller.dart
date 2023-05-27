import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:web_test/Modules/Advisor_side/main/main_screen.dart';
import 'package:web_test/Modules/Trainers_side/main/main_screen.dart';

import '../../../Model/TTrainers.dart';
import '../../../Utils/firebase.dart';
import '../../../widget/snackbar_helper.dart';

class LoginController extends GetxController {
  TextEditingController myEmailController = TextEditingController();
  TextEditingController myPasswordController = TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  // @override
  // void onInit() {
  //   defaultLoginInfo();
  //   adminlogin();
  //   super.onInit();
  // }

  // defaultLoginInfo() async {
  //   Map<String, dynamic> tUser = {
  //     'userName': 'backup',
  //     'password': 'backup123456789',
  //   };
  //   CacheHelper()
  //       .saveToStorage(key: Constants.defaultLoginInfoKey, value: tUser);
  // }

  // adminlogin() async {
  //   Map<String, dynamic> tUser = {
  //     'userName': 'admin',
  //     'password': 'admin',
  //   };
  //   CacheHelper().saveToStorage(key: Constants.adminloginKey, value: tUser);
  // }

  // setdata() {
  //   // if (defualtData.isEmpty) {
  //   print('save');
  //   defaultLoginInfo();
  //   adminlogin();
  //   // }
  // }
  removeImagePicker() {
    pickfile = null;
    update();
  }

  String? fileName;
  Uint8List? pickfile;
  pickImage() async {
    FilePickerResult? result = await FilePickerWeb.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );
    if (result != null) {
      pickfile = result.files.single.bytes!;
      fileName = result.files.single.name;

      update();
    } else {}
    update();
  }

  List<TTrainers> newsData = [];

  registerTr(
      {required String title,
      required String description,
      required String email,
      required String phone,
      required String imageUrl}) async {
    newsData = [];

    Map<String, String> data = {
      'title': title,
      'description': description,
      'date': DateFormat('yyyy-MM-dd kk:mm:ss').format(DateTime.now()),
      'imageUrl': imageUrl,
      'email': email,
      'phone': phone
    };
    print('in');
    var database = FirebaseUtiles.fireStore;

    await database
        .add(data)
        .then((value) => {
              SnackBarHelper.show(
                  msg: 'check the email to accept from the manager',
                  backgroundColor: Colors.green),
              Get.offAll(() => TrMainScreen()),
              nameController.text = '',
              emailController.text = '',
              descController.text = '',
              passwordController.text = '',
              phoneController.text = '',
              removeImagePicker(),
              update(),
            })
        .catchError((e) {
      print(e.toString());
    });
    print('out');

    update();
  }

  registerAdv(
      {required String title,
      required String description,
      required String email,
      required String phone,
      required String imageUrl}) async {
    newsData = [];

    Map<String, dynamic> data = {
      'name': title,
      'trainee': description,
      'date': DateFormat('yyyy-MM-dd kk:mm:ss').format(DateTime.now()),
      'trinerNum': '0',
      'email': email,
      'phone': phone
    };
    print('in');
    var database = FirebaseUtiles.fireStoreAdvisor;

    await database
        .add(data)
        .then((value) => {
              SnackBarHelper.show(
                  msg: 'Regiter Success', backgroundColor: Colors.green),
              Get.offAll(() => AdvMainScreen()),
              nameController.text = '',
              emailController.text = '',
              descController.text = '',
              passwordController.text = '',
              phoneController.text = '',
              removeImagePicker(),
              update(),
            })
        .catchError((e) {
      print(e.toString());
    });
    print('out');

    update();
  }

  uploadImage({
    required String title,
    required String description,
    required String email,
    required String phone,
  }) async {
    update();

    final refStorge = FirebaseUtiles.refStorge;
    refStorge.child("files/$fileName").putData(pickfile!).then((value) {
      value.ref.getDownloadURL().then((value) => {
            registerTr(
                title: title,
                description: description,
                imageUrl: value.isEmpty ? '' : value,
                email: email,
                phone: phone),
          });
      update();
    });
    update();
  }
}
