import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/news/news_model.dart';
import '../model/doctor/doctor_model.dart'; // Import your DoctorModel
import '../service/firebase/firebase_options.dart';

//firebase dosyasylarini sildigim icin hata verir eger kullanirsaniz firebas tekrar kurun
@immutable
class ApplicationStart {
  const ApplicationStart._();

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await Hive.initFlutter();
    await Hive.openBox('settings');

    // Register your adapters
    Hive.registerAdapter(NewsModelAdapter());
    Hive.registerAdapter(DoctorModelAdapter());

    // Open your boxes
    await Hive.openBox<NewsModel>('newsboxModelSave');
    await Hive.openBox<NewsModel>('favoriteNewsBox');
    await Hive.openBox<DoctorModel>('doctorBox');
    await Hive.openBox<DoctorModel>('docFavModelsBox');
  }
}
