part of 'movie_cubit.dart';

class MovieState extends Equatable {
  final List<Movie> allMovies;
  final RequestApiDataState allMoviesDataState;
  final String allMoviesMessageState;

  const MovieState({
    this.allMovies = const [],
    this.allMoviesDataState = RequestApiDataState.dataLoading,
    this.allMoviesMessageState = '',
  });

  MovieState copyWith({
    List<Movie>? allMovies,
    RequestApiDataState? allMoviesDataState,
    String? allMoviesMessageState,
  }) {
    return MovieState(
      allMovies: allMovies ?? this.allMovies,
      allMoviesDataState: allMoviesDataState ?? this.allMoviesDataState,
      allMoviesMessageState:
          allMoviesMessageState ?? this.allMoviesMessageState,
    );
  }

  @override
  List<Object?> get props => [
        allMovies,
        allMoviesDataState,
        allMoviesMessageState,
      ];
}
