import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../model/doctor/doctor_model.dart';

class FirebaseDoctorService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addDoctorsToFirebase(List<DoctorModel> doctors) async {
    final batch = _firestore.batch();

    try {
      for (DoctorModel doctor in doctors) {
        final docRef = _firestore.collection('doctors').doc();
        batch.set(docRef, doctor.toMap());
      }
      await batch.commit();
      if (kDebugMode) {
        print("All doctors added to Firestore successfully.");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error adding doctors to Firestore: $e");
      }
    }
  }


  
}


class FirebaseService<T> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addItemsToFirebase(List<T> items, String collectionName, T Function(T) toMap) async {
    final batch = _firestore.batch();

    try {
      for (T item in items) {
        final docRef = _firestore.collection(collectionName).doc();
        batch.set(docRef, toMap(item));
      }
      await batch.commit();
      if (kDebugMode) {
        print("All items added to Firestore successfully.");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error adding items to Firestore: $e");
      }
    }
  }
}
