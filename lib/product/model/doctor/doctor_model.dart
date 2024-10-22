import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'doctor_model.g.dart';

@HiveType(typeId: 1)
class DoctorModel extends Equatable {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String specialty;
  @HiveField(3)
  final int experienceYears;
  @HiveField(4)
  final List<String> education;
  @HiveField(5)
  final String currentWorkplace;
  @HiveField(6)
  final double rating;
  @HiveField(7)
  final List<String> reviews;
  @HiveField(8)
  final List<String> languages;
  @HiveField(9)
  final String workingHours;
  @HiveField(10)
  final List<String> insuranceAccepted;
  @HiveField(11)
  final String photoUrl;

  const DoctorModel({
    required this.name,
    required this.title,
    required this.specialty,
    required this.experienceYears,
    required this.education,
    required this.currentWorkplace,
    required this.rating,
    required this.reviews,
    required this.languages,
    required this.workingHours,
    required this.insuranceAccepted,
    required this.photoUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'title': title,
      'specialty': specialty,
      'experienceYears': experienceYears,
      'education': education,
      'currentWorkplace': currentWorkplace,
      'rating': rating,
      'reviews': reviews,
      'languages': languages,
      'workingHours': workingHours,
      'insuranceAccepted': insuranceAccepted,
      'photoUrl': photoUrl,
    };
  }

  factory DoctorModel.fromMap(Map<String, dynamic> map) {
    return DoctorModel(
      name: map['name'] ?? '',
      title: map['title'] ?? '',
      specialty: map['specialty'] ?? '',
      experienceYears: map['experienceYears'] ?? 0,
      education: List<String>.from(map['education'] ?? []),
      currentWorkplace: map['currentWorkplace'] ?? '',
      rating: map['rating']?.toDouble() ?? 0.0,
      reviews: List<String>.from(map['reviews'] ?? []),
      languages: List<String>.from(map['languages'] ?? []),
      workingHours: map['workingHours'] ?? '',
      insuranceAccepted: List<String>.from(map['insuranceAccepted'] ?? []),
      photoUrl: map['photoUrl'] ?? '',
    );
  }

  @override
  List<Object?> get props => [
        name,
        title,
        specialty,
        experienceYears,
        education,
        currentWorkplace,
        rating,
        reviews,
        languages,
        workingHours,
        insuranceAccepted,
        photoUrl,
      ];
}
