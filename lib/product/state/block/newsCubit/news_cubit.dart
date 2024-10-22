// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:medical_cliniv_v2/product/model/news/news_model.dart';

// import '../../../service/firebase/firebase_service.dart';

// part 'news_state.dart';

// class NewsCubit extends Cubit<NewsState> {
//   NewsCubit() : super(NewsInitial());

//   final FirebaseService _firebaseBaseService = FirebaseService();

//    void getNews() async {
//     try {
//       emit(NewsLoading());
//       List<NewsModel> news = await _firebaseBaseService.getNews();
//       emit(NewsLoaded(news));

//     } catch (e) {
//       emit(const NewsError("Failed to fetch news"));

//     }
//   }
// }

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medical_cliniv_v2/product/model/news/news_model.dart';
import '../../../service/firebase/firebase_service.dart';
import 'package:hive/hive.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  final FirebaseService _firebaseBaseService = FirebaseService();
  final Box<NewsModel> _newsBox = Hive.box<NewsModel>('newsboxModelSave');

  void getNews() async {
    emit(NewsLoading());

    // Hive'dan önbelleğe (cache) oku
    List<NewsModel> cachedNews = _newsBox.values.toList();

    if (cachedNews.isNotEmpty) {
      // Önbellekten haber varsa, onu yükle
      emit(NewsLoaded(cachedNews));
    } else {
      List<NewsModel> news = await _firebaseBaseService.getNews();
      await cacheNews(news);
      emit(NewsLoaded(news));
    }
  }

  Future<void> cacheNews(List<NewsModel> news) async {
    // Önceki verileri temizle
    await _newsBox.clear();

    // Yeni verileri kaydet
    for (var model in news) {
      await _newsBox.add(model);
    }
  }

  void refreshNews() async {
    emit(NewsLoading());

    try {
      // Firebase'den yeni verileri al
      List<NewsModel> news = await _firebaseBaseService.getNews();

      // Verileri Hive'a kaydet
      await cacheNews(news);

      // Yeni verileri emit et
      emit(NewsLoaded(news));
    } catch (e) {
      emit(const NewsError("Failed to refresh news"));
    }
  }

  Future<void> addNews(NewsModel model) async {
    try {
      emit(NewsLoading());

      // Yeni haberi Hive'a ekle
      await _newsBox.add(model);

      // UI'ı güncelle
      emit(NewsLoaded(_newsBox.values.toList())); // Tüm haberleri yükle
    } catch (e) {
      emit(const NewsError("Failed to add news"));
    }
  }

  Future<void> deleteNews(int index) async {
    try {
      emit(NewsLoading());

      // Haberi Hive'dan sil
      await _newsBox.deleteAt(index);

      // UI'ı güncelle
      emit(NewsLoaded(_newsBox.values.toList())); // Tüm haberleri yükle
    } catch (e) {
      emit(const NewsError("Failed to delete news"));
    }
  }
}
