import 'package:dartz/dartz.dart';
import 'package:marvel_app/src/core/usecases/base_usecase.dart';
import 'package:marvel_app/src/core/utils/error/failure.dart';
import 'package:marvel_app/src/layers/home/domain/entities/movie_entities/movie.dart';
import 'package:marvel_app/src/layers/home/domain/repositories/movie_repository.dart';

class GetAllMoviesUseCase extends BaseUseCase<List<Movie>, NoParameters> {
  final MovieRepository movieRepository;

  GetAllMoviesUseCase(this.movieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await movieRepository.getAllMovies();
  }
}
