import 'package:hive/hive.dart';
import '../core/constants/cache_contants.dart';

part 'manga_response_model.g.dart';

@HiveType(typeId: HiveConstants.mangaTypeId)
class MangaResponseModel {
  @HiveField(0)
  List<Data>? data;

  MangaResponseModel({this.data});

  MangaResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@HiveType(typeId: HiveConstants.dataTypeId)
class Data {
  @HiveField(0)
  int? malId;
  @HiveField(1)
  String? url;
  @HiveField(2)
  Images? images;
  @HiveField(3)
  String? title;
  @HiveField(4)
  String? titleEnglish;
  @HiveField(5)
  String? titleJapanese;
  @HiveField(6)
  String? synopsis;
  @HiveField(7)
  String? background;

  Data({
    this.malId,
    this.url,
    this.images,
    this.title,
    this.titleEnglish,
    this.titleJapanese,
    this.synopsis,
    this.background,
  });

  Data.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    url = json['url'];
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
    title = json['title'];
    titleEnglish = json['title_english'];
    titleJapanese = json['title_japanese'];
    synopsis = json['synopsis'];
    background = json['background'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mal_id'] = malId;
    data['url'] = url;
    if (images != null) {
      data['images'] = images!.toJson();
    }
    data['title'] = title;
    data['title_english'] = titleEnglish;
    data['title_japanese'] = titleJapanese;
    data['synopsis'] = synopsis;
    data['background'] = background;

    return data;
  }
}

@HiveType(typeId: HiveConstants.imagesTypeId)
class Images {
  @HiveField(0)
  Jpg? jpg;

  Images({this.jpg});

  Images.fromJson(Map<String, dynamic> json) {
    jpg = json['jpg'] != null ? Jpg.fromJson(json['jpg']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (jpg != null) {
      data['jpg'] = jpg!.toJson();
    }

    return data;
  }
}

@HiveType(typeId: HiveConstants.jpgTypeId)
class Jpg {
  @HiveField(0)
  String? imageUrl;

  Jpg({
    this.imageUrl,
  });

  Jpg.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image_url'] = imageUrl;

    return data;
  }
}
