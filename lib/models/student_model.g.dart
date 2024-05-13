// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentModelAdapter extends TypeAdapter<StudentModel> {
  @override
  final int typeId = 0;

  @override
  StudentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudentModel(
      name: fields[0] as String,
      age: fields[1] as int,
      batch: fields[2] as String,
      address: fields[3] as String,
      contactNumber: fields[4] as int,
      emailAddress: fields[5] as String,
      profilePicture: fields[6] as String?,
      parentName: fields[7] as String,
      dob: fields[8] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, StudentModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.batch)
      ..writeByte(3)
      ..write(obj.address)
      ..writeByte(4)
      ..write(obj.contactNumber)
      ..writeByte(5)
      ..write(obj.emailAddress)
      ..writeByte(6)
      ..write(obj.profilePicture)
      ..writeByte(7)
      ..write(obj.parentName)
      ..writeByte(8)
      ..write(obj.dob);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
