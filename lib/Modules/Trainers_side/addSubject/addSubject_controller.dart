import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:web_test/Modules/base/baseGetxController.dart';

import '../../../Utils/firebase.dart';
import '../../../widget/snackbar_helper.dart';

class AddTraineeController extends BaseGetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();

  addSubject() async {
    Map<String, String> data = {
      'title': titleController.text,
      'description': desController.text,
      'time': DateFormat('yyyy-MM-dd kk:mm:ss').format(DateTime.now()),
      'user': 'Ali',
      'state': 'Waiting'
    };
    print('in');
    var database = FirebaseUtiles.trfireStoreActivity;
    FirebaseUtiles.fireStoreActivity.add(data);

    await database
        .add(data)
        .then((value) => {
              SnackBarHelper.show(
                  msg: 'Waiting for a reply', backgroundColor: Colors.amber),
              titleController.text = '',
              desController.text = '',
              update(),
            })
        .catchError((e) {
      print(e.toString());
    });
    print('out');

    update();
  }
}
