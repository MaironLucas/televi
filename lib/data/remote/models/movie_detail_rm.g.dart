// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailRm _$MovieDetailRmFromJson(Map<String, dynamic> json) =>
    MovieDetailRm(
      backdropUrl: json['backdrop_url'] as String,
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
      id: json['id'] as int,
      overview: json['overview'] as String,
      posterUrl: json['poster_url'] as String,
      releaseDate: DateTime.parse(json['release_date'] as String),
      title: json['title'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
    );

Map<String, dynamic> _$MovieDetailRmToJson(MovieDetailRm instance) =>
    <String, dynamic>{
      'backdrop_url': instance.backdropUrl,
      'genres': instance.genres,
      'id': instance.id,
      'overview': instance.overview,
      'poster_url': instance.posterUrl,
      'release_date': instance.releaseDate.toIso8601String(),
      'title': instance.title,
      'vote_average': instance.voteAverage,
    };
