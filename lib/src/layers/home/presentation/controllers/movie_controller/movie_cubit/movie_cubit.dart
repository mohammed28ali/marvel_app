import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/usecases/base_usecase.dart';
import '../../../../../../core/utils/enums/enums.dart';
import '../../../../domain/entities/movie_entities/movie.dart';
import '../../../../domain/usecases/movies_usecases/get_all_movies_usecase.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final GetAllMoviesUseCase getAllMoviesUseCase;

  MovieCubit(this.getAllMoviesUseCase) : super(const MovieState());

  FutureOr<void> getAllMovies() async {
    final result = await getAllMoviesUseCase(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          allMoviesDataState: RequestApiDataState.dataError,
          allMoviesMessageState: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          allMovies: r,
          allMoviesDataState: RequestApiDataState.dataLoaded,
        ),
      ),
    );
  }
}
