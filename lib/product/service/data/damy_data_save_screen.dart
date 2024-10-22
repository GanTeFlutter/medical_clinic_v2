import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:medical_cliniv_v2/product/service/data/damy_data/notification_damy_data.dart';

import '../../model/notification_model.dart';


class DamyDataSaveScreen extends StatefulWidget {
  const DamyDataSaveScreen({super.key});

  @override
  State<DamyDataSaveScreen> createState() => _DamyDataSaveScreenState();
}

class _DamyDataSaveScreenState extends State<DamyDataSaveScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addNewsToFirebase(List<NewNotificationModel> news) async {
    final batch = _firestore.batch();

    try {
      for (NewNotificationModel article in news) {
        final docRef = _firestore.collection('notification').doc();
        batch.set(docRef, article.toJson());
      }
      await batch.commit();
      if (kDebugMode) {
        print("All news articles added to Firestore successfully.");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error adding news articles to Firestore: $e");
      }
    }
  }

  NotificationDamy notificationDamy = NotificationDamy();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DamyDataSaveScreen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await addNewsToFirebase(notificationDamy.dummyNotifications);
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('News added successfully!')));
        },
        child: const Icon(Icons.add),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
