import 'package:equatable/equatable.dart';

class TvShow extends Equatable {
  final int id;
  final String title;
  final String releaseDate;
  final int season;
  final int numberEpisodes;
  final String overview;
  final String coverUrl;
  final String trailerUrl;
  final String directedBy;
  final int phase;

  const TvShow({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.season,
    required this.numberEpisodes,
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
        season,
        numberEpisodes,
        overview,
        coverUrl,
        trailerUrl,
        directedBy,
        phase,
      ];
}
