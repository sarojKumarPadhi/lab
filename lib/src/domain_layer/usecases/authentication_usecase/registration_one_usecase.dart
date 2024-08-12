import 'package:equatable/equatable.dart';

import '../../../../core/data_layer_exports.dart';

import '../../../data_layer/models/common_api_model/local_user_detail_model.dart';
import '../../../data_layer/models/authentication_model/registration_one_req.dart';
import '../../entities/common_usecase_entites/common_entities.dart';
import '../../repositories/authentication_repository.dart';
import '../../repositories/local_storage_repository.dart';

class RegistrationOneUsecase
    implements UsecaseWithParams<CommonEntites<Null>, RegistrationOneParams> {
  const RegistrationOneUsecase(this._repository, this._localStorageRepository);

  final AuthenticationRepository _repository;
  final LocalStorageRepository _localStorageRepository;

  @override
  ResultFutureT<CommonEntites<Null>> call(RegistrationOneParams params) async {
    final result = await _repository.regiStepOneRepo(RegistrationOneReq(
        labName: params.labOwnerName,
        labOwnerName: params.regiNumber,
        labRegistrationNumber: params.labName));

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
                    registrationStep: 2,
                    accountStatus: r?.accountStatus));
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

class RegistrationOneParams extends Equatable {
  final String labName;
  final String labOwnerName;
  final String regiNumber;

  const RegistrationOneParams(
      {required this.labName,
      required this.labOwnerName,
      required this.regiNumber});

  @override
  List<Object?> get props => [labName, labOwnerName, regiNumber];
}
