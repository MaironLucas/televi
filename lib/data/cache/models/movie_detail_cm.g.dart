// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_cm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieDetailCmAdapter extends TypeAdapter<MovieDetailCm> {
  @override
  final int typeId = 1;

  @override
  MovieDetailCm read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieDetailCm(
      backdropUrl: fields[0] as String,
      genres: (fields[1] as List).cast<String>(),
      id: fields[2] as int,
      overview: fields[3] as String,
      posterUrl: fields[4] as String,
      releaseDate: fields[5] as DateTime,
      title: fields[6] as String,
      voteAverage: fields[7] as double,
    );
  }

  @override
  void write(BinaryWriter writer, MovieDetailCm obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.backdropUrl)
      ..writeByte(1)
      ..write(obj.genres)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.overview)
      ..writeByte(4)
      ..write(obj.posterUrl)
      ..writeByte(5)
      ..write(obj.releaseDate)
      ..writeByte(6)
      ..write(obj.title)
      ..writeByte(7)
      ..write(obj.voteAverage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailCmAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
