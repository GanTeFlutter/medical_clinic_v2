import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import '../../../../model/doctor/doctor_model.dart';

part 'doctor_fav_cubit_state.dart';

class DoctorFavCubitCubit extends Cubit<DoctorFavCubitState> {
  DoctorFavCubitCubit() : super(DoctorFavCubitInitial());


  //hive adapter ile oluşturulan DoctorModel sınıfı için box oluşturuldu
  final Box<DoctorModel> _docFavModelsBox =
      Hive.box<DoctorModel>('docFavModelsBox');

  //uygulama acildiginda favori doktorları listelemek için
  void getFavoriteDoctors() {
    emit(DoctorFavCubitLoading());
    final List<DoctorModel> favoriteDoctors =
        Hive.box<DoctorModel>('docFavModelsBox').values.toList();
    emit(DoctorFavCubitLoaded(favoriteDoctors));
  }

  Future<void> addFavoriteDoctor(DoctorModel model) async {
    await _docFavModelsBox.add(model);
    //yeni eklenen doktorları listelemek için
    emit(DoctorFavCubitLoaded(_docFavModelsBox.values.toList()));
  }

  Future<void> deleteFavoriteDoctor(int index) async {
    await _docFavModelsBox.deleteAt(index);
    //silinen doktorları listelemek için
    emit(DoctorFavCubitLoaded(_docFavModelsBox.values.toList()));
  }
}
