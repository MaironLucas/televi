import 'package:json_annotation/json_annotation.dart';

part 'movie_detail_rm.g.dart';

@JsonSerializable()
class MovieDetailRm {
  MovieDetailRm({
    required this.backdropUrl,
    required this.genres,
    required this.id,
    required this.overview,
    required this.posterUrl,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
  });

  factory MovieDetailRm.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailRmFromJson(json);
  Map<String, dynamic> toJson() => _$MovieDetailRmToJson(this);

  @JsonKey(name: 'backdrop_url')
  String backdropUrl;

  List<String> genres;

  int id;

  String overview;

  @JsonKey(name: 'poster_url')
  String posterUrl;

  @JsonKey(name: 'release_date')
  DateTime releaseDate;

  String title;

  @JsonKey(name: 'vote_average')
  double voteAverage;
}
