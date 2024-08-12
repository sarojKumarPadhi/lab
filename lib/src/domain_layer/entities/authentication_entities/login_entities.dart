import 'package:equatable/equatable.dart';

class LoginEntities extends Equatable {
  final String verificationId;
  final int? resendToken;
  final String mobileNo;
  const LoginEntities({
    required this.verificationId,
    this.resendToken,
    required this.mobileNo,
  });
  const LoginEntities.copyWith(
      {required String verificationId,
      int? resendToken,
      required String mobileNo})
      : this(
            verificationId: verificationId,
            resendToken: resendToken,
            mobileNo: mobileNo);

  @override
  List<Object?> get props => [verificationId];
}
