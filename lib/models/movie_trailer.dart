class MovieTrailer {
  final String id;
  final String iso639_1;
  final String iso3166_1;
  final String key;
  final String name;
  final String site;
  final int size;
  final String type;

  MovieTrailer({
    required this.id,
    required this.iso639_1,
    required this.iso3166_1,
    required this.key,
    required this.name,
    required this.site,
    required this.size,
    required this.type,
  });

  factory MovieTrailer.fromJson(Map<String, dynamic> json) {
    return MovieTrailer(
      id: json['id'].toString(),
      iso639_1: json['iso_639_1'],
      iso3166_1: json['iso_3166_1'],
      key: json['key'],
      name: json['name'],
      site: json['site'],
      size: json['size'],
      type: json['type'],
    );
  }
}
