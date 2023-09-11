import 'package:firebase_auth/firebase_auth.dart';
import 'package:marvel_app/src/layers/auth/data/exption_handler/auth_expection_handler.dart';
import '../../domain/usecases/sign_in_with_email_password_usecase.dart';
import '../../domain/usecases/sign_up_with_email_password_usecase.dart';

abstract class AuthRemoteDataSource {
  Future<void> signInWithEmailAndPassword(SignInParameters parameters);
  Future<void> signUpWithEmailAndPassword(SignUpParameters parameters);
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> signInWithEmailAndPassword(SignInParameters parameters) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: parameters.email, password: parameters.password);
    } catch (error) {
      AuthExceptionHandler.handleException(error);
    }
  }

  @override
  Future<void> signUpWithEmailAndPassword(SignUpParameters parameters) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: parameters.email, password: parameters.password);
    } catch (error) {
      AuthExceptionHandler.handleException(error);
    }
  }


}
