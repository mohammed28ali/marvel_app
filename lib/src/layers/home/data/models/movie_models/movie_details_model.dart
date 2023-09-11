import 'package:marvel_app/src/layers/home/data/models/movie_models/movie_recommentation_model.dart';
import 'package:marvel_app/src/layers/home/domain/entities/movie_entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {required super.id,
      required super.title,
      required super.duration,
      required super.overview,
      required super.trailerUrl,
      required super.directedBy,
      required super.phase,
      required super.movieRecommendation,
      required super.coverUrl});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        id: json["id"],
        title: json["title"],
        duration: json["duration"],
        overview: json["overview"],
        coverUrl: json["cover_url"],
        trailerUrl: json["trailer_url"],
        directedBy: json["directed_by"],
        phase: json["phase"],
        movieRecommendation: List<MovieRecommendationModel>.from(
            json["related_movies"]
                .map((x) => MovieRecommendationModel.fromJson(x))),
      );
}
