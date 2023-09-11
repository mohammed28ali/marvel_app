import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/src/layers/auth/domain/usecases/sign_in_with_email_password_usecase.dart';
import 'package:marvel_app/src/layers/auth/domain/usecases/sign_up_with_email_password_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignInWithEmailAndPasswordUseCase signInUseCase;
  final SignUpWithEmailAndPasswordUseCase signUpUseCase;

  AuthCubit(this.signInUseCase, this.signUpUseCase)
      : super(AuthInitial());

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    final response =
        await signInUseCase(SignInParameters(email: email, password: password));

    response.fold(
      (l) => emit(SignInError(error: l.message)),
      (r) => emit(SignInSuccess()),
    );
  }

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    final response =
        await signUpUseCase(SignUpParameters(email: email, password: password));

    response.fold(
      (l) => emit(SignUpError(error: l.message)),
      (r) => emit(SignUpSuccess()),
    );
  }

}
