import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import '../../../model/news/news_model.dart';

part 'favorite_cubit_state.dart';

class FavoriteCubitCubit extends Cubit<FavoriteCubitState> {
  FavoriteCubitCubit() : super(FavoriteCubitInitial());
  final Box<NewsModel> _favoriteNewsBox =
      Hive.box<NewsModel>('favoriteNewsBox'); 

  void getFavoriteNews() {
    emit(FavoriteCubitLoading());

    final List<NewsModel> favoriteNews =
        Hive.box<NewsModel>('favoriteNewsBox').values.toList();
    emit(FavoriteCubitLoaded(favoriteNews));
  }

  Future<void> addFavoriteNews(NewsModel model) async {
    await _favoriteNewsBox.add(model);
    emit(FavoriteCubitLoaded(_favoriteNewsBox.values.toList()));
  }

  Future<void> deleteFavoriteNews(int index) async {
    await _favoriteNewsBox.deleteAt(index);
    emit(FavoriteCubitLoaded(_favoriteNewsBox.values.toList()));
  }
}
