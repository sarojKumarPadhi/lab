import 'package:equatable/equatable.dart';
import 'package:jonk_lab/core/errors/exceptions.dart';

import '../utils/enums.dart';

abstract class Failure extends Equatable {
  const Failure({required this.message, required this.code, this.msgType});
  final String message;
  final String code;
  final MsgType? msgType;
  @override
  List<Object?> get props => [
        message,
        code,
      ];
}

class LocalFailure extends Failure {
  const LocalFailure(
      {required super.message, required super.code, super.msgType});
  LocalFailure.fromException(LocalException exception)
      : this(message: exception.message, code: exception.code);
}

class ApiFailure extends Failure {
  // Constructor with optional parameters and default values
  ApiFailure({
    String? message = "Unknown error occurred from API",
    String? code = 'api-error',
    super.msgType,
  }) : super(
          message: message!,
          code: code!,
        );
  ApiFailure.fromException(APIException exception)
      : this(message: exception.message, code: exception.code);
}

class OtherFailure extends Failure {
  const OtherFailure(
      {required super.message, required super.code, super.msgType});
  OtherFailure.fromException(Object exception)
      : this(
            message: exception.toString(),
            code: 'other-exception',
            msgType: MsgType.failure);
}
