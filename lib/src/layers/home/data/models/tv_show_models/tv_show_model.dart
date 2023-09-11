
import '../../../domain/entities/tv_show_entities/tv_show.dart';

class TvShowModel extends TvShow {
  const TvShowModel({
    required super.id,
    required super.title,
    required super.releaseDate,
    required super.season,
    required super.numberEpisodes,
    required super.overview,
    required super.coverUrl,
    required super.trailerUrl,
    required super.directedBy,
    required super.phase,
  });
  factory TvShowModel.fromJson(Map<String, dynamic> json) => TvShowModel(
        id: json["id"],
        title: json["title"],
        releaseDate: json["release_date"] ?? "2023-09-06",
        season: json["season"],
        numberEpisodes: json["number_episodes"],
        overview: json["overview"] ?? "OverView",
        coverUrl: json["cover_url"],
        trailerUrl: json["trailer_url"] ?? "https://youtu.be/D7eFpRf4tac",
        directedBy: json["directed_by"] ?? " Directed By",
        phase: json["phase"],
      );
}
