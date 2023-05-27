import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:web_test/Model/TMeeting.dart';
import 'package:web_test/Modules/base/baseGetxController.dart';

import '../../../Model/TActivity.dart';
import '../../../Utils/firebase.dart';

class AdvHomeController extends BaseGetxController {
  List<TMeeting> newsData = [];
  List key = [];

  fetchDataFromFirebase() async {
    newsData = [];
    setLoading(true);
    update();

    var starCountRef = FirebaseUtiles.advfireStoreMeeting;
    starCountRef.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) {
        key.add(element.id);
        newsData.add(TMeeting.fromJson(element.data() as Map<String, dynamic>));
      });

      update();
    });
    setLoading(false);
    update();
  }

  @override
  void onInit() {
    fetchDataFromFirebase();
    super.onInit();
  }
}
