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
      synopsis: fields[4] as String?,
      background: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Data obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.malId)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.images)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.synopsis)
      ..writeByte(5)
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
    );
  }

  @override
  void write(BinaryWriter writer, Jpg obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.imageUrl);
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

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MangaResponseModel _$MangaResponseModelFromJson(Map<String, dynamic> json) =>
    MangaResponseModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      malId: json['mal_id'] as int?,
      url: json['url'] as String?,
      images: json['images'] == null
          ? null
          : Images.fromJson(json['images'] as Map<String, dynamic>),
      title: json['title'] as String?,
      synopsis: json['synopsis'] as String?,
      background: json['background'] as String?,
    );

Images _$ImagesFromJson(Map<String, dynamic> json) => Images(
      jpg: json['jpg'] == null
          ? null
          : Jpg.fromJson(json['jpg'] as Map<String, dynamic>),
    );

Jpg _$JpgFromJson(Map<String, dynamic> json) => Jpg(
      imageUrl: json['image_url'] as String?,
    );
