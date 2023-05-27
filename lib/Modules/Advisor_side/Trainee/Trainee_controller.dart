import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:web_test/Modules/base/baseGetxController.dart';

import '../../../Model/TTrainers.dart';
import '../../../Utils/firebase.dart';

class AdvTraineeController extends BaseGetxController {
   
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
  @override
  void onInit() {
    fetchDataFromFirebase();
    // TODO: implement onInit
    super.onInit();
  }
}