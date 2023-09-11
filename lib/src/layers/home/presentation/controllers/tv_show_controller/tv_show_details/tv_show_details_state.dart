part of 'tv_show_details_cubit.dart';

class TvShowDetailsState extends Equatable {
  final TvShow? tvShowDetails;
  final RequestApiDataState tvShowDetailsDataState;
  final String tvShowDetailsMessageState;

  const TvShowDetailsState({
    this.tvShowDetails,
    this.tvShowDetailsDataState = RequestApiDataState.dataLoading,
    this.tvShowDetailsMessageState = '',
  });

  TvShowDetailsState copyWith({
    TvShow? tvShowDetails,
    RequestApiDataState? tvShowDetailsDataState,
    String? tvShowDetailsMessageState,
  }) =>
      TvShowDetailsState(
        tvShowDetails: tvShowDetails ?? this.tvShowDetails,
        tvShowDetailsDataState:
            tvShowDetailsDataState ?? this.tvShowDetailsDataState,
        tvShowDetailsMessageState:
            tvShowDetailsMessageState ?? this.tvShowDetailsMessageState,
      );

  @override
  List<Object?> get props => [
        tvShowDetails,
        tvShowDetailsDataState,
        tvShowDetailsMessageState,
      ];
}
