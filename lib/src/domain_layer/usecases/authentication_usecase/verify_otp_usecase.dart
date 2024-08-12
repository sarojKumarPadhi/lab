import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/typedef.dart';

import '../../../data_layer/models/authentication_model/registration_zero_req.dart';
import '../../../data_layer/models/common_api_model/local_user_detail_model.dart';
import '../../entities/authentication_entities/otp_verfiy_entities.dart';
import '../../entities/common_usecase_entites/common_entities.dart';
import '../../repositories/authentication_repository.dart';
import '../../repositories/local_storage_repository.dart';

class VerifyOtpUseCase extends UsecaseWithParams<
    CommonEntites<OtpVerfiyEntities?>, VerifyOtpParams> {
  const VerifyOtpUseCase(this._repository, this._localStorageRepository);

  final AuthenticationRepository _repository;
  final LocalStorageRepository _localStorageRepository;

  @override
  ResultCommonEntites<OtpVerfiyEntities?> call(VerifyOtpParams params) async {
    final result = await _repository.verifyOtp(RegistrationZeroReq(
        phoneNumber: params.mobileNo,
        otp: params.otp,
        verificationId: params.verificationId));

    return result.fold(
      (l) => Left(l),
      (r) async {
        if (r.statusCode == "200") {
          await _localStorageRepository.saveUser(LocalUserDetailModel(
              mobile: r.data?.phoneNumber,
              userUid: r.data?.userUid,
              registrationStep: r.data?.registrationStep,
              deviceToken: r.data?.deviceToken,
              accountStatus: r.data?.accountStatus));
          return Right(CommonEntites(
            data: OtpVerfiyEntities(
                mobile: r.data?.phoneNumber,
                userUid: r.data?.userUid,
                registrationStep: r.data?.registrationStep,
                deviceToken: r.data?.deviceToken,
                accountStatus: r.data?.accountStatus),
          ));
        } else {
          return Right(CommonEntites(
              data: OtpVerfiyEntities(
                  mobile: r.data?.phoneNumber,
                  userUid: r.data?.userUid,
                  registrationStep: r.data?.registrationStep,
                  deviceToken: r.data?.deviceToken,
                  accountStatus: r.data?.accountStatus),
              msgType: MsgType.failure));
        }
      },
    );
  }
}

class VerifyOtpParams extends Equatable {
  final String verificationId;
  final String mobileNo;
  final String otp;
  const VerifyOtpParams(
      {required this.verificationId,
      required this.mobileNo,
      required this.otp});

  @override
  List<Object?> get props => [
        verificationId,
        otp,
        mobileNo,
      ];
}
