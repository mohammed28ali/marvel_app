import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/usecases/base_usecase.dart';
import '../../../../../../core/utils/enums/enums.dart';
import '../../../../domain/entities/tv_show_entities/tv_show.dart';
import '../../../../domain/usecases/tv_show_usecase/get_all_tv_shows.usecase.dart';

part 'tv_show_state.dart';

class TvShowCubit extends Cubit<TvShowState> {
  final GetAllTvShowsUseCase getAllTvShowsUseCase;

  TvShowCubit(this.getAllTvShowsUseCase) : super(const TvShowState());

  FutureOr<void> getAllTvShows() async {
    final result = await getAllTvShowsUseCase(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          allTvShowsDataState: RequestApiDataState.dataError,
          allTvShowsMessageState: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          allTvShows: r,
          allTvShowsDataState: RequestApiDataState.dataLoaded,
        ),
      ),
    );
  }
}
