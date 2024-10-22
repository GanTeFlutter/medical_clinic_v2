part of 'favorite_cubit_cubit.dart';

sealed class FavoriteCubitState extends Equatable {
  const FavoriteCubitState();

  @override
  List<Object> get props => [];
}

final class FavoriteCubitInitial extends FavoriteCubitState {}
final class FavoriteCubitLoading extends FavoriteCubitState {}
final class FavoriteCubitLoaded extends FavoriteCubitState {
  final List<NewsModel> favoriteNews;
  const FavoriteCubitLoaded(this.favoriteNews);

  @override
  List<Object> get props => [favoriteNews];
}
final class FavoriteCubitError extends FavoriteCubitState {
  final String message;
  const FavoriteCubitError(this.message);

  @override
  List<Object> get props => [message];
}