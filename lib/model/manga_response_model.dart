import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import '../core/constants/cache_contants.dart';

part 'manga_response_model.g.dart';

@JsonSerializable(createToJson: false)
@HiveType(typeId: HiveConstants.mangaTypeId)
class MangaResponseModel {
  @HiveField(0)
  List<Data>? data;

  MangaResponseModel({this.data});

  factory MangaResponseModel.fromJson(Map<String, dynamic> data) => _$MangaResponseModelFromJson(data);
}

@JsonSerializable(createToJson: false)
@HiveType(typeId: HiveConstants.dataTypeId)
class Data {
  @HiveField(0)
  @JsonKey(name: "mal_id")
  int? malId;
  @HiveField(1)
  String? url;
  @HiveField(2)
  Images? images;
  @HiveField(3)
  String? title;
  @HiveField(4)
  String? synopsis;
  @HiveField(5)
  String? background;

  Data({
    this.malId,
    this.url,
    this.images,
    this.title,
    this.synopsis,
    this.background,
  });

  factory Data.fromJson(Map<String, dynamic> data) => _$DataFromJson(data);
}

@JsonSerializable(createToJson: false)
@HiveType(typeId: HiveConstants.imagesTypeId)
class Images {
  @HiveField(0)
  Jpg? jpg;

  Images({this.jpg});

  factory Images.fromJson(Map<String, dynamic> data) => _$ImagesFromJson(data);
}

@JsonSerializable(createToJson: false)
@HiveType(typeId: HiveConstants.jpgTypeId)
class Jpg {
  @HiveField(0)
  @JsonKey(name: "image_url")
  String? imageUrl;

  Jpg({
    this.imageUrl,
  });

  factory Jpg.fromJson(Map<String, dynamic> data) => _$JpgFromJson(data);
}
