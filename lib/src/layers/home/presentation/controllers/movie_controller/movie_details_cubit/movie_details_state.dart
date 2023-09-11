part of 'movie_details_cubit.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestApiDataState movieDetailsDataState;
  final String movieDetailsMessageState;

  final MovieDetails? movieTrailer;
  final RequestApiDataState movieTrailerDataState;
  final String movieTrailerMessageState;

  final VideoPlayerState videoPlayerState;

  const MovieDetailsState(
      {this.movieDetails,
      this.movieDetailsDataState = RequestApiDataState.dataLoading,
      this.movieDetailsMessageState = '',
      this.movieTrailer,
      this.movieTrailerDataState = RequestApiDataState.dataLoading,
      this.movieTrailerMessageState = '',
      this.videoPlayerState = VideoPlayerState.paused});

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestApiDataState? movieDetailsDataState,
    String? movieDetailsMessageState,
    MovieDetails? movieTrailer,
    RequestApiDataState? movieTrailerDataState,
    String? movieTrailerMessageState,
    VideoPlayerState? videoPlayerState,
  }) =>
      MovieDetailsState(
        movieDetails: movieDetails ?? this.movieDetails,
        movieDetailsDataState:
            movieDetailsDataState ?? this.movieDetailsDataState,
        movieDetailsMessageState:
            movieDetailsMessageState ?? this.movieDetailsMessageState,
        movieTrailer: movieTrailer ?? this.movieTrailer,
        movieTrailerDataState:
            movieTrailerDataState ?? this.movieTrailerDataState,
        movieTrailerMessageState:
            movieTrailerMessageState ?? this.movieTrailerMessageState,
        videoPlayerState: videoPlayerState ?? this.videoPlayerState,
      );

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsDataState,
        movieDetailsMessageState,
        movieTrailer,
        movieTrailerDataState,
        movieTrailerMessageState,
        videoPlayerState
      ];
}
