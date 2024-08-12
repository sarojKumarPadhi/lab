import 'package:equatable/equatable.dart';

import '../../../../core/data_layer_exports.dart';
import '../../../data_layer/models/authentication_model/registration_five_req.dart';
import '../../../data_layer/models/common_api_model/local_user_detail_model.dart';
import '../../entities/common_usecase_entites/common_entities.dart';
import '../../repositories/authentication_repository.dart';
import '../../repositories/local_storage_repository.dart';

class RegistrationFiveUsecase
    implements UsecaseWithParams<CommonEntites<Null>, RegistrationFiveParams> {
  const RegistrationFiveUsecase(this._repository, this._localStorageRepository);

  final AuthenticationRepository _repository;
  final LocalStorageRepository _localStorageRepository;

  @override
  ResultFutureT<CommonEntites<Null>> call(RegistrationFiveParams params) async {
    final result = await _repository.regiStepFiveRepo(RegistrationFiveReq(
        bike1Url: params.bike1Url,
        bike2Url: params.bike2Url,
        selfie1Url: params.selfie1Url,
        selfie2Url: params.selfie2Url));

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
                    registrationStep: 6));
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

class RegistrationFiveParams extends Equatable {
  final String bike1Url;
  final String bike2Url;
  final String selfie1Url;
  final String selfie2Url;
  const RegistrationFiveParams(
      {required this.bike1Url,
      required this.bike2Url,
      required this.selfie2Url,
      required this.selfie1Url});

  @override
  List<Object?> get props => [bike1Url, bike2Url, selfie1Url, selfie2Url];
}
