// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MangaResponseModelAdapter extends TypeAdapter<MangaResponseModel> {
  @override
  final int typeId = 1;

  @override
  MangaResponseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MangaResponseModel(
      data: (fields[0] as List?)?.cast<Data>(),
    );
  }

  @override
  void write(BinaryWriter writer, MangaResponseModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MangaResponseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DataAdapter extends TypeAdapter<Data> {
  @override
  final int typeId = 2;

  @override
  Data read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Data(
      malId: fields[0] as int?,
      url: fields[1] as String?,
      images: fields[2] as Images?,
      title: fields[3] as String?,
      titleEnglish: fields[4] as String?,
      titleJapanese: fields[5] as String?,
      synopsis: fields[6] as String?,
      background: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Data obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.malId)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.images)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.titleEnglish)
      ..writeByte(5)
      ..write(obj.titleJapanese)
      ..writeByte(6)
      ..write(obj.synopsis)
      ..writeByte(7)
      ..write(obj.background);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ImagesAdapter extends TypeAdapter<Images> {
  @override
  final int typeId = 3;

  @override
  Images read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Images(
      jpg: fields[0] as Jpg?,
    );
  }

  @override
  void write(BinaryWriter writer, Images obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.jpg);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImagesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class JpgAdapter extends TypeAdapter<Jpg> {
  @override
  final int typeId = 4;

  @override
  Jpg read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Jpg(
      imageUrl: fields[0] as String?,
      smallImageUrl: fields[1] as String?,
      largeImageUrl: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Jpg obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.imageUrl)
      ..writeByte(1)
      ..write(obj.smallImageUrl)
      ..writeByte(2)
      ..write(obj.largeImageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JpgAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
