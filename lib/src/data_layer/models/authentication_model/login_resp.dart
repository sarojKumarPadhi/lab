import 'dart:convert';

import 'package:equatable/equatable.dart';

class LoginResp extends Equatable {
  final String verificationId;
  final int? resendToken;

  const LoginResp({required this.verificationId, this.resendToken});

  factory LoginResp.fromJson(Map<String, dynamic> data) => LoginResp(
        verificationId: data['verificationId'] as String,
        resendToken: data['resendToken'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'verificationId': verificationId,
        'resendToken': resendToken,
      };

  /// `dart:convert`
  ///
  /// Converts [LoginResp] to a JSON string.
  String toJson() => json.encode(toMap());

  LoginResp copyWith({
    String? verificationId,
    int? resendToken,
  }) {
    return LoginResp(
      verificationId: verificationId ?? this.verificationId,
      resendToken: resendToken ?? this.resendToken,
    );
  }

  @override
  List<Object?> get props => [
        verificationId,
      ];
}
