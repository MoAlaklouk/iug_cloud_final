import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:web_test/Model/TActivity.dart';
import 'package:web_test/Model/TTrainers.dart';
import 'package:web_test/Modules/base/baseGetxController.dart';

import '../../../Utils/firebase.dart';

class ActivityController extends BaseGetxController {
  List<TActivity> newsData = [];
  List key = [];

  fetchDataFromFirebase() async {
    newsData = [];
    setLoading(true);
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
    setLoading(false);
    update();
  }

  @override
  void onInit() {
    // fetchDataFromFirebase();
    super.onInit();
  }
}
