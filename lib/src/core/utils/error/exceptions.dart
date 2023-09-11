import 'package:equatable/equatable.dart';
import '../../network/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  ServerException({
    required this.errorMessageModel,
  });
}

class FirebaseException extends Equatable implements Exception {
  final String? message;

  const FirebaseException([this.message]);

  @override
  List<Object?> get props => [message];
}

class InvalidEmailException extends FirebaseException {
  const InvalidEmailException([message])
      : super("Email address Not Correct.");
}

class WrongPasswordException extends FirebaseException {
  const WrongPasswordException([message]) : super("Wrong Password.");
}

class UserNotFoundException extends FirebaseException {
  const UserNotFoundException([message]) : super("User Not Found.");
}

class UserDisabledException extends FirebaseException {
  const UserDisabledException([message])
      : super("User with this email has been disabled.");
}

class TooManyRequestsException extends FirebaseException {
  const TooManyRequestsException([message])
      : super("many requests.....Try again later.");
}

class OperationNotAllowedException extends FirebaseException {
  const OperationNotAllowedException([message])
      : super("SignIn is not enabled.");
}

class EmailAlreadyExistsException extends FirebaseException {
  const EmailAlreadyExistsException([message])
      : super("The email has already been SignUp.");
}
