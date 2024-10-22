part of 'doctor_fav_cubit_cubit.dart';

sealed class DoctorFavCubitState extends Equatable {
  const DoctorFavCubitState();

  @override
  List<Object> get props => [];
}

final class DoctorFavCubitInitial extends DoctorFavCubitState {}

final class DoctorFavCubitLoading extends DoctorFavCubitState {}

final class DoctorFavCubitLoaded extends DoctorFavCubitState {
  final List<DoctorModel> doctors;

  const DoctorFavCubitLoaded(this.doctors);

  @override
  List<Object> get props => [doctors];
}

 

final class DoctorFavCubitError extends DoctorFavCubitState {
  final String message;

  const DoctorFavCubitError(this.message);

  @override
  List<Object> get props => [message];
}

