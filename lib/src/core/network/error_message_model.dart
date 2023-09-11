import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String status;
  final int statusCode;
  final String statusMessage;

  const ErrorMessageModel({
    required this.status,
    required this.statusCode,
    required this.statusMessage,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) =>
      ErrorMessageModel(
        status: json["status"],
        statusCode: json["statusCode"],
        statusMessage: json["message"],
      );

  @override
  List<Object?> get props => [
        status,
        statusCode,
        statusMessage,
      ];
}
