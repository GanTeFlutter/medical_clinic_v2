// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DoctorModelAdapter extends TypeAdapter<DoctorModel> {
  @override
  final int typeId = 1;

  @override
  DoctorModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DoctorModel(
      name: fields[0] as String,
      title: fields[1] as String,
      specialty: fields[2] as String,
      experienceYears: fields[3] as int,
      education: (fields[4] as List).cast<String>(),
      currentWorkplace: fields[5] as String,
      rating: fields[6] as double,
      reviews: (fields[7] as List).cast<String>(),
      languages: (fields[8] as List).cast<String>(),
      workingHours: fields[9] as String,
      insuranceAccepted: (fields[10] as List).cast<String>(),
      photoUrl: fields[11] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DoctorModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.specialty)
      ..writeByte(3)
      ..write(obj.experienceYears)
      ..writeByte(4)
      ..write(obj.education)
      ..writeByte(5)
      ..write(obj.currentWorkplace)
      ..writeByte(6)
      ..write(obj.rating)
      ..writeByte(7)
      ..write(obj.reviews)
      ..writeByte(8)
      ..write(obj.languages)
      ..writeByte(9)
      ..write(obj.workingHours)
      ..writeByte(10)
      ..write(obj.insuranceAccepted)
      ..writeByte(11)
      ..write(obj.photoUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DoctorModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
