import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:web_test/Model/TActivity.dart';
import 'package:web_test/Model/TMeeting.dart';
import 'package:web_test/Model/TTrainers.dart';
import 'package:web_test/Modules/base/baseGetxController.dart';

import '../../../Utils/firebase.dart';
import '../../../widget/snackbar_helper.dart';

class ActivityController extends BaseGetxController {
  List<TActivity> newsData = [];
  List key = [];

  fetchDataFromFirebase() async {
    newsData = [];
    update();

    var starCountRef = FirebaseUtiles.trfireStoreActivity;
    starCountRef.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) {
        key.add(element.id);
        newsData
            .add(TActivity.fromJson(element.data() as Map<String, dynamic>));
      });

      update();
    });
    update();
  }

  @override
  void onInit() {
    fetchDataFromFirebase();
    super.onInit();
  }

  DateTime dateTime = DateTime.now();
  chageDateTime(value) {
    dateTime = value;
    update();
  }

  List<TMeeting> newsDataMeeting = [];
  List mkey = [];
  addMeeting(title, des) async {
    Map<String, String> data = {
      'trineeTitle': title,
      'des': des,
      'date': DateFormat('yyyy-MM-dd kk:mm:ss').format(dateTime),
      'userName': 'Ali',
      'state': 'Waiting'
    };
    var database = FirebaseUtiles.advfireStoreMeeting;
    FirebaseUtiles.fireStoreActivity.add({
      'title': title,
      'description': des,
      'time': DateFormat('yyyy-MM-dd kk:mm:ss').format(dateTime),
      'user': 'Ali',
      'state': 'Waiting'
    });

    await database
        .add(data)
        .then((value) => {
              SnackBarHelper.show(
                  msg: 'add success', backgroundColor: Colors.green),
              update(),
            })
        .catchError((e) {
      print(e.toString());
    });
    print('out');

    update();
  }
}
