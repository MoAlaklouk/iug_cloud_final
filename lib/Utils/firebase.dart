import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';

import '../Helpers/constant.dart';

class FirebaseUtiles {
  static late CollectionReference fireStore;
  static late CollectionReference fireStoreTrainR;
  static late CollectionReference fireStoreAdvisor;
  static late CollectionReference fireStoreActivity;
  static late CollectionReference trfireStoreActivity;
  static late CollectionReference advfireStoreMeeting;
  static late CollectionReference trfireStoreForYou;
  static late CollectionReference trfireStoremyTrainee;

  static late Reference refStorge;

  static init() {
    fireStore = FirebaseFirestore.instance.collection('Trainers');
    fireStoreTrainR = FirebaseFirestore.instance.collection('TrainersReqeust');
    fireStoreAdvisor = FirebaseFirestore.instance.collection('Advisor');
    fireStoreActivity = FirebaseFirestore.instance.collection('Activity');
    fireStoreActivity = FirebaseFirestore.instance.collection('trActivity');
    fireStoreActivity = FirebaseFirestore.instance.collection('advMeeting');
    trfireStoreForYou = FirebaseFirestore.instance.collection('foryou');
    trfireStoremyTrainee = FirebaseFirestore.instance.collection('myTrainee');

    refStorge = firebase_storage.FirebaseStorage.instance.ref();
  }
}
