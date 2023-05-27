import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:web_test/Model/TActivity.dart';

import '../../../Model/TAdvisor.dart';
import '../../../Utils/firebase.dart';
import '../../base/baseGetxController.dart';

class HomeController extends BaseGetxController {
  @override
  void onInit() async {
    // fetchDataFromFirebase();
    super.onInit();
  }

  List<TActivity> data = [];
  List<dynamic> key = [];
  fetchDataFromFirebase() async {
    data = [];
    setLoading(true);

    var starCountRef = FirebaseUtiles.fireStoreActivity;
    starCountRef.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) {
        key.add(element.id);
        data.add(TActivity.fromJson(element.data() as Map<String, dynamic>));
      });

      update();
    });
    setLoading(false);
  }
}
