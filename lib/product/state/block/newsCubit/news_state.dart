part of 'news_cubit.dart';

sealed class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

final class NewsLoaded extends NewsState {
  final List<NewsModel> news;
  const NewsLoaded(this.news);

  @override
  List<Object> get props => [news];
}

final class NewsError extends NewsState {
  final String message;
  const NewsError(this.message);

  @override
  List<Object> get props => [message];
}
