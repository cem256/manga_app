class TopMangaResponseModel {
  Pagination? pagination;
  List<Data>? data;

  TopMangaResponseModel({this.pagination, this.data});

  TopMangaResponseModel.fromJson(Map<String, dynamic> json) {
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pagination {
  int? lastVisiblePage;
  bool? hasNextPage;
  int? currentPage;
  Items? items;

  Pagination(
      {this.lastVisiblePage, this.hasNextPage, this.currentPage, this.items});

  Pagination.fromJson(Map<String, dynamic> json) {
    lastVisiblePage = json['last_visible_page'];
    hasNextPage = json['has_next_page'];
    currentPage = json['current_page'];
    items = json['items'] != null ? Items.fromJson(json['items']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['last_visible_page'] = lastVisiblePage;
    data['has_next_page'] = hasNextPage;
    data['current_page'] = currentPage;
    if (items != null) {
      data['items'] = items!.toJson();
    }
    return data;
  }
}

class Items {
  int? count;
  int? total;
  int? perPage;

  Items({this.count, this.total, this.perPage});

  Items.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    total = json['total'];
    perPage = json['per_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['total'] = total;
    data['per_page'] = perPage;
    return data;
  }
}

class Data {
  int? malId;
  String? url;
  Images? images;
  String? title;
  String? titleEnglish;
  String? titleJapanese;
  List<String>? titleSynonyms;
  String? type;
  int? chapters;
  int? volumes;
  String? status;
  bool? publishing;
  Published? published;
  double? score;
  double? scored;
  int? scoredBy;
  int? rank;
  int? popularity;
  int? members;
  int? favorites;
  String? synopsis;
  String? background;
  List<Authors>? authors;

  Data(
      {this.malId,
      this.url,
      this.images,
      this.title,
      this.titleEnglish,
      this.titleJapanese,
      this.titleSynonyms,
      this.type,
      this.chapters,
      this.volumes,
      this.status,
      this.publishing,
      this.published,
      this.score,
      this.scored,
      this.scoredBy,
      this.rank,
      this.popularity,
      this.members,
      this.favorites,
      this.synopsis,
      this.background,
      this.authors});

  Data.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    url = json['url'];
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
    title = json['title'];
    titleEnglish = json['title_english'];
    titleJapanese = json['title_japanese'];
    titleSynonyms = json['title_synonyms'].cast<String>();
    type = json['type'];
    chapters = json['chapters'];
    volumes = json['volumes'];
    status = json['status'];
    publishing = json['publishing'];
    published = json['published'] != null
        ? Published.fromJson(json['published'])
        : null;
    score = json['score'];
    scored = json['scored'];
    scoredBy = json['scored_by'];
    rank = json['rank'];
    popularity = json['popularity'];
    members = json['members'];
    favorites = json['favorites'];
    synopsis = json['synopsis'];
    background = json['background'];
    if (json['authors'] != null) {
      authors = <Authors>[];
      json['authors'].forEach((v) {
        authors!.add(Authors.fromJson(v));
      });
    }
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
    data['title_synonyms'] = titleSynonyms;
    data['type'] = type;
    data['chapters'] = chapters;
    data['volumes'] = volumes;
    data['status'] = status;
    data['publishing'] = publishing;
    if (published != null) {
      data['published'] = published!.toJson();
    }
    data['score'] = score;
    data['scored'] = scored;
    data['scored_by'] = scoredBy;
    data['rank'] = rank;
    data['popularity'] = popularity;
    data['members'] = members;
    data['favorites'] = favorites;
    data['synopsis'] = synopsis;
    data['background'] = background;
    if (authors != null) {
      data['authors'] = authors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  Jpg? jpg;
  Jpg? webp;

  Images({this.jpg, this.webp});

  Images.fromJson(Map<String, dynamic> json) {
    jpg = json['jpg'] != null ? Jpg.fromJson(json['jpg']) : null;
    webp = json['webp'] != null ? Jpg.fromJson(json['webp']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (jpg != null) {
      data['jpg'] = jpg!.toJson();
    }
    if (webp != null) {
      data['webp'] = webp!.toJson();
    }
    return data;
  }
}

class Jpg {
  String? imageUrl;
  String? smallImageUrl;
  String? largeImageUrl;

  Jpg({this.imageUrl, this.smallImageUrl, this.largeImageUrl});

  Jpg.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
    smallImageUrl = json['small_image_url'];
    largeImageUrl = json['large_image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image_url'] = imageUrl;
    data['small_image_url'] = smallImageUrl;
    data['large_image_url'] = largeImageUrl;
    return data;
  }
}

class Published {
  String? from;
  String? to;
  Prop? prop;
  String? string;

  Published({this.from, this.to, this.prop, this.string});

  Published.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    prop = json['prop'] != null ? Prop.fromJson(json['prop']) : null;
    string = json['string'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['from'] = from;
    data['to'] = to;
    if (prop != null) {
      data['prop'] = prop!.toJson();
    }
    data['string'] = string;
    return data;
  }
}

class Prop {
  From? from;
  From? to;

  Prop({this.from, this.to});

  Prop.fromJson(Map<String, dynamic> json) {
    from = json['from'] != null ? From.fromJson(json['from']) : null;
    to = json['to'] != null ? From.fromJson(json['to']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (from != null) {
      data['from'] = from!.toJson();
    }
    if (to != null) {
      data['to'] = to!.toJson();
    }
    return data;
  }
}

class From {
  int? day;
  int? month;
  int? year;

  From({this.day, this.month, this.year});

  From.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    month = json['month'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['month'] = month;
    data['year'] = year;
    return data;
  }
}

class Authors {
  int? malId;
  String? type;
  String? name;
  String? url;

  Authors({this.malId, this.type, this.name, this.url});

  Authors.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    type = json['type'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mal_id'] = malId;
    data['type'] = type;
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
