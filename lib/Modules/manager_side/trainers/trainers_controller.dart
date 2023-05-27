import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart' as fbs;
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as Path;

import '../../../Model/TTrainers.dart';
import '../../../Utils/firebase.dart';
import '../../../widget/snackbar_helper.dart';
import '../../base/baseGetxController.dart';

class TrainersController extends BaseGetxController {
  TextEditingController newsTitelController = TextEditingController();
  TextEditingController newsDescController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void onInit() async {
    fetchDataFromFirebase();
    super.onInit();
  }

  List<TTrainers> newsData = [];
  List<dynamic> key = [];
  fetchDataFromFirebase() async {
    newsData = [];
    setLoading(true);

    var starCountRef = FirebaseUtiles.fireStore;
    starCountRef.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) {
        key.add(element.id);
        newsData
            .add(TTrainers.fromJson(element.data() as Map<String, dynamic>));
      });

      update();
    });
    setLoading(false);
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

  pickDate(BuildContext context) {
    var lastFiveYears = DateTime.now().subtract(const Duration(days: 3652));

    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: lastFiveYears,
        lastDate: DateTime.now());
  }

  sendData(
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
                  msg: 'success', backgroundColor: Colors.green),
              newsTitelController.text = '',
              newsDescController.text = '',
              emailController.text = '',
              phoneController.text = '',
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
            sendData(
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

  removeImagePicker() {
    pickfile = null;
    update();
  }

  deleteFormFirebase(String path, index) async {
    await FirebaseUtiles.fireStore.doc('$path').delete().then((value) => {
          newsData.remove(index),
          update(),
          SnackBarHelper.show(
              msg: 'تم الحذف بنجاح', backgroundColor: Colors.green)
        });
    fetchDataFromFirebase();
    update();
  }

  updataDataFormFirebase(
      {required String title,
      required String description,
      required int path}) async {
    Map<String, String> data = {
      'title': title,
      'description': description,
    };
    await FirebaseUtiles.fireStore.doc(key[path]).update(data).then((value) => {
          SnackBarHelper.show(msg: 'success', backgroundColor: Colors.green),
          newsTitelController.text = '',
          newsDescController.text = '',
          fetchDataFromFirebase(),
          update()
        });
    update();
  }
}
