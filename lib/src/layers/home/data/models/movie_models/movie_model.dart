import 'package:marvel_app/src/layers/home/domain/entities/movie_entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.title,
    required super.releaseDate,
    required super.duration,
    required super.overview,
    required super.coverUrl,
    required super.trailerUrl,
    required super.directedBy,
    required super.phase,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json["id"],
        title: json["title"],
        releaseDate: json["release_date"],
        duration: json["duration"],
        overview: json["overview"] ?? "OverView",
        coverUrl: json["cover_url"],
        trailerUrl: json["trailer_url"] ?? "https://youtu.be/wS_qbDztgVY",
        directedBy: json["directed_by"],
        phase: json["phase"],
      );
}
