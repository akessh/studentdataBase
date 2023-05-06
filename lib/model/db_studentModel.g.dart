// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_studentModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentmodelAdapter extends TypeAdapter<Studentmodel> {
  @override
  final int typeId = 0;

  @override
  Studentmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Studentmodel(
      name: fields[0] as String,
      age: fields[1] as int,
      rollno: fields[2] as int,
      father: fields[3] as String,
      imagePath: fields[4] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Studentmodel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.rollno)
      ..writeByte(3)
      ..write(obj.father)
      ..writeByte(4)
      ..write(obj.imagePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
