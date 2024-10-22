import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medical_cliniv_v2/product/model/doctor/doctor_model.dart';

import '../../../service/firebase/firebase_service.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit() : super(DoctorInitial());
  final FirebaseService _firebaseBaseService = FirebaseService();

  void getDoctors() async {
    try {
      emit(DoctorLoading());
      List<DoctorModel> doctors = await _firebaseBaseService.getAllDoctors();
      emit(DoctorLoaded(doctors));
    } catch (e) {
      emit(const DoctorError("Failed to fetch doctors"));
    }
  }
}
