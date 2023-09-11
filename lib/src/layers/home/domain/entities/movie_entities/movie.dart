import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String releaseDate;
  final int duration;
  final String overview;
  final String coverUrl;
  final String trailerUrl;
  final String directedBy;
  final int phase;

  const Movie({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.duration,
    required this.overview,
    required this.coverUrl,
    required this.trailerUrl,
    required this.directedBy,
    required this.phase,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        releaseDate,
        duration,
        overview,
        coverUrl,
        trailerUrl,
        directedBy,
        phase
      ];
}
