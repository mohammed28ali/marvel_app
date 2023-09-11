
import '../../../domain/entities/movie_entities/movie_recommendation.dart';

class MovieRecommendationModel extends MovieRecommendation {
  const MovieRecommendationModel({
    required super.id,
    required super.coverUrl,
    required super.title,
  });

  factory MovieRecommendationModel.fromJson(Map<String, dynamic> json) =>
      MovieRecommendationModel(
        id: json["id"],
        coverUrl: json["cover_url"],
        title: json["title"],
      );
}
