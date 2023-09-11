part of 'tv_show_cubit.dart';

class TvShowState extends Equatable {
  final List<TvShow> allTvShows;
  final RequestApiDataState allTvShowsDataState;
  final String allTvShowsMessageState;

  const TvShowState({
    this.allTvShows = const [],
    this.allTvShowsDataState = RequestApiDataState.dataLoading,
    this.allTvShowsMessageState = '',
  });

  TvShowState copyWith({
    List<TvShow>? allTvShows,
    RequestApiDataState? allTvShowsDataState,
    String? allTvShowsMessageState,
  }) {
    return TvShowState(
      allTvShows: allTvShows ?? this.allTvShows,
      allTvShowsDataState: allTvShowsDataState ?? this.allTvShowsDataState,
      allTvShowsMessageState:
          allTvShowsMessageState ?? this.allTvShowsMessageState,
    );
  }

  @override
  List<Object?> get props => [
        allTvShows,
        allTvShowsDataState,
        allTvShowsMessageState,
      ];
}
