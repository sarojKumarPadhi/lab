import 'package:equatable/equatable.dart';

class APIException extends Equatable implements Exception {
  const APIException({required this.message, required this.code});
  final String? message;
  final String? code;

  @override
  List<Object?> get props => [code, message];
}

class LocalException extends Equatable implements Exception {
  const LocalException({
    required this.message,
    required this.code,
  });
  final String message;
  final String code;

  @override
  List<Object?> get props => [code, message];
}
