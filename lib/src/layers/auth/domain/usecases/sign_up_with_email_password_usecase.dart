import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:marvel_app/src/core/usecases/base_usecase.dart';
import 'package:marvel_app/src/core/utils/error/failure.dart';
import 'package:marvel_app/src/layers/auth/domain/repositories/auth_repository.dart';

class SignUpWithEmailAndPasswordUseCase
    extends BaseUseCase<void, SignUpParameters> {
  final AuthRepository authRepository;

  SignUpWithEmailAndPasswordUseCase(this.authRepository);

  @override
  Future<Either<Failure, void>> call(SignUpParameters parameters) async {
    return await authRepository.signUpWithEmailAndPassword(parameters);
  }
}

class SignUpParameters extends Equatable {
  final String email;
  final String password;

  const SignUpParameters({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
