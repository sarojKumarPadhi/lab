import 'package:equatable/equatable.dart';

import '../../../../core/data_layer_exports.dart';

import '../../../data_layer/models/common_api_model/local_user_detail_model.dart';
import '../../../data_layer/models/authentication_model/registration_four_req.dart';
import '../../entities/common_usecase_entites/common_entities.dart';
import '../../repositories/authentication_repository.dart';
import '../../repositories/local_storage_repository.dart';

class RegistrationFourUsecase
    implements UsecaseWithParams<CommonEntites<Null>, RegistrationFourParams> {
  const RegistrationFourUsecase(this._repository, this._localStorageRepository);

  final AuthenticationRepository _repository;
  final LocalStorageRepository _localStorageRepository;

  @override
  ResultFutureT<CommonEntites<Null>> call(RegistrationFourParams params) async {
    final result = await _repository.regiStepFourRepo(RegistrationFourReq(
        aadharUrl: params.aadharUrl,
        bankPassBookUrl: params.bankPassBookUrl,
        educationCertificateUrl: params.educationCertificateUrl,
        panCardUrl: params.panCardUrl));

    return result.fold(
      (l) => Left(l),
      (r) async {
        if (r.statusCode == "200") {
          await _localStorageRepository.getUser().then((value) async {
            value.fold(
              (l) => Left(l),
              (r) async {
                await _localStorageRepository.saveUser(LocalUserDetailModel(
                    mobile: r?.mobile,
                    userUid: r?.userUid,
                    deviceToken: r?.deviceToken,
                    accountStatus: r?.accountStatus,
                    registrationStep: 5));
              },
            );
          });

          return Right(CommonEntites());
        } else {
          return Left(ApiFailure(message: r.msg, code: r.statusCode));
        }
      },
    );
  }
}

class RegistrationFourParams extends Equatable {
  final String aadharUrl;
  final String bankPassBookUrl;
  final String educationCertificateUrl;
  final String panCardUrl;

  const RegistrationFourParams(
      {required this.aadharUrl,
      required this.bankPassBookUrl,
      required this.educationCertificateUrl,
      required this.panCardUrl});

  @override
  List<Object?> get props => [
        aadharUrl,
        panCardUrl,
        bankPassBookUrl,
        educationCertificateUrl,
        panCardUrl
      ];
}
