class MovieDetailModel {
  bool? adult;
  String? backdropPath;
  List<Genres>? genres;
  String? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  int? runtime;
  String? status;
  String? tagline;
  num? voteAverage;
  int? voteCount;

  MovieDetailModel({
    this.adult,
    this.backdropPath,
    this.genres,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.runtime,
    this.status,
    this.tagline,
    this.voteAverage,
    this.voteCount,
    // Added default values for missing fields
    required genreIds,
    required popularity,
    required title,
    required video,
  });

  MovieDetailModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add(Genres.fromJson(v));
      });
    }
    id = json['id'].toString() ?? '';
    imdbId = json['imdb_id'] ?? '';
    originalLanguage = json['original_language'] ?? '';
    originalTitle = json['original_title'] ?? '';
    overview = json['overview'] ?? '';
    posterPath = json['poster_path'] ?? '';
    releaseDate = json['release_date'] ?? '';
    runtime = json['runtime'] ?? 0;
    status = json['status'] ?? '';
    tagline = json['tagline'] ?? '';
    voteAverage = json['vote_average'] ?? 0.0;
    voteCount = json['vote_count'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    if (genres != null) {
      data['genres'] = genres!.map((v) => v.toJson()).toList();
    }
    data['id'] = id ?? '';
    data['imdb_id'] = imdbId ?? '';
    data['original_language'] = originalLanguage ?? '';
    data['original_title'] = originalTitle ?? '';
    data['overview'] = overview ?? '';
    data['poster_path'] = posterPath ?? '';
    data['release_date'] = releaseDate ?? '';
    data['runtime'] = runtime ?? 0;
    data['status'] = status ?? '';
    data['tagline'] = tagline ?? '';
    data['vote_average'] = voteAverage ?? 0.0;
    data['vote_count'] = voteCount ?? 0;
    return data;
  }
}

class Genres {
  int? id;
  String? name;

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id ?? 0;
    data['name'] = name ?? '';
    return data;
  }
}
