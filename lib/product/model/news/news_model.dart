import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'news_model.g.dart';

@HiveType(typeId: 0)
class NewsModel extends Equatable {
  @HiveField(0)
  final String photoUrl;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final double popularity;
  @HiveField(4)
  final DateTime date;
  @HiveField(5)
  final String kaynak;

  const NewsModel({
    required this.photoUrl,
    required this.title,
    required this.description,
    required this.popularity,
    required this.date,
    required this.kaynak,
  });

  // JSON'dan `NewsModel` oluşturmak için factory metodu
  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      photoUrl: json['photoUrl'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      kaynak: json['kaynak'] as String,
    );
  }

  // `NewsModel`'i JSON formatına dönüştürmek için metot
  Map<String, dynamic> toJson() {
    return {
      'photoUrl': photoUrl,
      'title': title,
      'description': description,
      'popularity': popularity,
      'date': date.toIso8601String(),
      'kaynak': kaynak,
    };
  }

  @override
  List<Object?> get props =>
      [photoUrl, title, description, popularity, date, kaynak];
}
