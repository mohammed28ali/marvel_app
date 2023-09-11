import 'package:dartz/dartz.dart';
import '../../../../core/utils/error/failure.dart';
import '../usecases/sign_in_with_email_password_usecase.dart';
import '../usecases/sign_up_with_email_password_usecase.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> signInWithEmailAndPassword(
      SignInParameters parameters);
  Future<Either<Failure, void>> signUpWithEmailAndPassword(
      SignUpParameters parameters);
}
