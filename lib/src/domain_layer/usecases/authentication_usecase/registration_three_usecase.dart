import 'package:equatable/equatable.dart';

import '../../../../core/data_layer_exports.dart';

import '../../../data_layer/models/authentication_model/registration_three_req.dart';
import '../../../data_layer/models/common_api_model/local_user_detail_model.dart';
import '../../entities/common_usecase_entites/common_entities.dart';
import '../../repositories/authentication_repository.dart';
import '../../repositories/local_storage_repository.dart';

class RegistrationThreeUsecase
    implements UsecaseWithParams<CommonEntites<Null>, RegistrationThreeParams> {
  const RegistrationThreeUsecase(
      this._repository, this._localStorageRepository);

  final AuthenticationRepository _repository;
  final LocalStorageRepository _localStorageRepository;

  @override
  ResultFutureT<CommonEntites<Null>> call(
      RegistrationThreeParams params) async {
    final result = await _repository.regiStepThreeRepo(RegistrationThreeReq(
        accountNumber: params.accountNumber,
        bankId: params.bankName,
        branchName: params.branchName,
        ifscCode: params.ifscCode));

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
                    registrationStep: 4));
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

class RegistrationThreeParams extends Equatable {
  final String bankName;
  final String branchName;
  final String accountNumber;
  final String reAccountNumber;
  final String ifscCode;

  const RegistrationThreeParams({
    required this.bankName,
    required this.branchName,
    required this.accountNumber,
    required this.reAccountNumber,
    required this.ifscCode,
  });

  @override
  List<Object?> get props =>
      [bankName, branchName, accountNumber, ifscCode, reAccountNumber];
}
