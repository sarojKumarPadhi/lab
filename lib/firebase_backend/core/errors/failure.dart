import 'package:equatable/equatable.dart';

import '../utils/common_firebase_resp.dart';
import 'exceptions.dart';

abstract class FirbaseFailure extends Equatable {
  const FirbaseFailure({
    required this.message,
    required this.code,
  });
  final String message;
  final String code;

  @override
  List<Object?> get props => [
        message,
      ];
}

class ApiFailure extends FirbaseFailure {
  const ApiFailure({
    required super.message,
    required super.code,
  });

  static Map<String, dynamic> fromException(ApiException exception) =>
      firebaseCommonResp(
        null,
        msg: exception.message,
        statusCode: exception.code,
      );
}

class FireBaseAuthFailure extends FirbaseFailure {
  const FireBaseAuthFailure({
    required super.message,
    required super.code,
  });

  // FireBaseFailure.fromException(FireBaseException exception)
  //     : this(message: exception.message, code: exception.code);

  static Map<String, dynamic> fromException(FireBaseException exception) {
    String message = exception.message ?? "Firbase Auth Error";

    switch (exception.code) {
      case 'invalid-phone-number':
        message = "Invalid phone number.";
        break;
      case 'network-request-failed':
        message = "No Internet connection";
        break;
      case 'too-many-requests':
        message = "Quota exceeded, too many requests for verification.";
        break;
      case 'session-expired':
        message = "Verification session expired, please try again.";
        break;
      case 'unknown':
        message = "Unknown Error Occur";
    }
    return firebaseCommonResp(
      null,
      msg: message,
      statusCode: "401",
    );
  }
}

class ServerFailure extends FirbaseFailure {
  const ServerFailure({required super.message, required super.code});

  static Map<String, dynamic> fromException() {
    return firebaseCommonResp(null,
        statusCode: "500", msg: "Internal Server Error");
  }
}
