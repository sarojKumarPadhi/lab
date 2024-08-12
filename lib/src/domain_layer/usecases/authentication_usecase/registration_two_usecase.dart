import 'package:equatable/equatable.dart';

import '../../../../core/data_layer_exports.dart';

import '../../../data_layer/models/authentication_model/registration_two_req.dart';
import '../../../data_layer/models/common_api_model/local_user_detail_model.dart';
import '../../entities/common_usecase_entites/common_entities.dart';
import '../../repositories/authentication_repository.dart';
import '../../repositories/local_storage_repository.dart';

class RegistrationTwoUsecase
    implements UsecaseWithParams<CommonEntites<Null>, RegistrationTwoParams> {
  const RegistrationTwoUsecase(this._repository, this._localStorageRepository);

  final AuthenticationRepository _repository;
  final LocalStorageRepository _localStorageRepository;

  @override
  ResultFutureT<CommonEntites<Null>> call(RegistrationTwoParams params) async {
    final result = await _repository.regiStepTwoRepo(RegistrationTwoReq(
        city: params.city,
        country: params.country,
        district: params.district,
        pinCode: params.pinCode,
        state: params.state));

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
                    registrationStep: 3));
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

class RegistrationTwoParams extends Equatable {
  final String city;
  final String country;
  final String district;
  final String pinCode;
  final String state;

  const RegistrationTwoParams(
      {required this.city,
      required this.country,
      required this.district,
      required this.pinCode,
      required this.state});

  @override
  List<Object?> get props => [city, state, district, pinCode, country];
}
