import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:marvel_app/src/core/usecases/base_usecase.dart';
import 'package:marvel_app/src/core/utils/error/failure.dart';
import 'package:marvel_app/src/layers/home/domain/entities/tv_show_entities/tv_show.dart';
import 'package:marvel_app/src/layers/home/domain/repositories/tv_show_repository.dart';

class GetTvShowDetailsUseCase
    extends BaseUseCase<TvShow, TvShowDetailsParameters> {
  final TvShowRepository tvShowRepository;

  GetTvShowDetailsUseCase(this.tvShowRepository);

  @override
  Future<Either<Failure, TvShow>> call(
      TvShowDetailsParameters parameters) async {
    return await tvShowRepository.getTvShowDetails(parameters);
  }
}

class TvShowDetailsParameters extends Equatable {
  final int tvshowId;

  const TvShowDetailsParameters({required this.tvshowId});

  @override
  List<Object?> get props => [tvshowId];
}
