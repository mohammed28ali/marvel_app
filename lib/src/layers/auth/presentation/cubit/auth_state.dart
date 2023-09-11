part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class SignInLoading extends AuthState {}

class SignInSuccess extends AuthState {}

class SignInError extends AuthState {
  final String error;

  const SignInError({required this.error});

  @override
  List<Object> get props => [error];
}

class SignUpLoading extends AuthState {}

class SignUpSuccess extends AuthState {}

class SignUpError extends AuthState {
  final String error;

  const SignUpError({required this.error});

  @override
  List<Object> get props => [error];
}
