// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/doctor/doctor_model.dart';
import '../../model/news/news_model.dart';

sealed class FirebaseBaseService {
  //get
  Future<List<DoctorModel>> getAllDoctors();
  Future<void> addFavoriteDoctors(DoctorModel doctor);
  Future<List<DoctorModel>> getFavoriteDoctor();
  Future<List<NewsModel>> getNews();
}

class FirebaseService implements FirebaseBaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Doctorlar veritabanından çekilir.
  @override
  Future<List<DoctorModel>> getAllDoctors() async {
    try {
      final response = await _firestore.collection("doctors").get();

      if (response.docs.isNotEmpty) {
        final List<DoctorModel> users = response.docs.map((doc) {
          final data = doc.data();
          return DoctorModel.fromMap(data);
        }).toList();

        return users;
      } else {
        throw Exception("No doctors found.");
      }
    } catch (e) {
      throw Exception("Failed to fetch doctors: $e");
    }
  }

  @override
  Future<void> addFavoriteDoctors(DoctorModel doctor) async {
    await _firestore
        .collection('favoriteDoctors')
        .add(doctor.toMap())
        .then((value) => print("**addFavoriteDoctors**Doktor favorilere eklendi: $doctor"));
  }

  @override
  Future<List<DoctorModel>> getFavoriteDoctor() async {
    QuerySnapshot querySnapshot = await _firestore.collection('favoriteDoctors').get();
    List<DoctorModel> gelenListe = querySnapshot.docs
        .map((doc) => DoctorModel.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
    return gelenListe;
  }

  @override
  Future<List<NewsModel>> getNews() async {
    try {
      final response = await _firestore.collection("news").get();

      if (response.docs.isNotEmpty) {
        final List<NewsModel> users = response.docs.map((doc) {
          final data = doc.data();
          return NewsModel.fromJson(data);
        }).toList();

        return users;
      } else {
        throw Exception("No doctors found.");
      }
    } catch (e) {
      throw Exception("Failed to fetch doctors: $e");
    }
  }
}
