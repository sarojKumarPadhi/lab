import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseException extends FirebaseAuthException {
  FireBaseException({required super.code, super.message});
}

class ApiException extends Equatable implements Exception {
  const ApiException(
      {this.message = "Internal Server Error", this.code = '500'});
  final String message;
  final String code;

  @override
  List<Object?> get props => [code, message];
}
