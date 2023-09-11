import 'package:equatable/equatable.dart';

class MovieRecommendation extends Equatable {
  final int id;
  final String coverUrl;
  final String title;

  const MovieRecommendation({
    required this.id,
    required this.coverUrl,
    required this.title,
  });

  @override
  List<Object?> get props => [
        id,
        coverUrl,
        title,
      ];
}
