import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:web_test/Model/TSubject.dart';
import 'package:web_test/Modules/base/baseGetxController.dart';

import '../../../Utils/firebase.dart';

class TrHomeController extends BaseGetxController {
  List<TSubject> myTData = [];
  List<dynamic> key = [];
  fetchDataFromFirebase() async {
    myTData = [];
    setLoading(true);

    var starCountRef = FirebaseUtiles.trfireStoremyTrainee;
    starCountRef.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) {
        key.add(element.id);
        myTData.add(TSubject.fromJson(element.data() as Map<String, dynamic>));
      });

      update();
    });
    setLoading(false);
  }
  List<TSubject> formyData = [];
  List<dynamic> fkey = [];
  fetchDataFromFirebaseforme() async {
    formyData = [];
    setLoading(true);

    var starCountRef = FirebaseUtiles.trfireStoreForYou;
    starCountRef.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) {
        key.add(element.id);
        formyData.add(TSubject.fromJson(element.data() as Map<String, dynamic>));
      });

      update();
    });
    setLoading(false);
  }

  @override
  void onInit() {
    fetchDataFromFirebase();
    fetchDataFromFirebaseforme();
    super.onInit();
  }
}
