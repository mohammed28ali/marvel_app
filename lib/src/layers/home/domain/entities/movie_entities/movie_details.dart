import 'package:equatable/equatable.dart';
import 'package:marvel_app/src/layers/home/domain/entities/movie_entities/movie_recommendation.dart';

class MovieDetails extends Equatable {
  final int id;
  final String title;
  final int duration;
  final String overview;
  final String coverUrl;
  final String trailerUrl;
  final String directedBy;
  final int phase;
  final List<MovieRecommendation> movieRecommendation;

  const MovieDetails({
    required this.id,
    required this.title,
    required this.duration,
    required this.overview,
    required this.coverUrl,
    required this.trailerUrl,
    required this.directedBy,
    required this.phase,
    required this.movieRecommendation,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        duration,
        overview,
        coverUrl,
        trailerUrl,
        directedBy,
        phase,
        movieRecommendation,
      ];
}
