import 'package:json_annotation/json_annotation.dart';

part 'movie_rm.g.dart';

@JsonSerializable()
class MovieRm {
  MovieRm({
    required this.id,
    required this.title,
    required this.posterUrl,
  });

  factory MovieRm.fromJson(Map<String, dynamic> json) =>
      _$MovieRmFromJson(json);

  Map<String, dynamic> toJson() => _$MovieRmToJson(this);

  int id;

  String title;

  @JsonKey(name: 'poster_url')
  String posterUrl;
}
