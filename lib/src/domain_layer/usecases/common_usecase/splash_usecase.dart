import '../../../../core/data_layer_exports.dart';
import '../../entities/common_usecase_entites/local_user_entities.dart';
import '../../repositories/local_storage_repository.dart';

class SplashUsecase implements UsecaseWithoutParams<LocalUserEntities> {
  SplashUsecase(this._localStorageRepository);
  final LocalStorageRepository _localStorageRepository;
  @override
  ResultFutureT<LocalUserEntities> call() async {
    return await _localStorageRepository.getUser().then(
      (value) {
        return value.fold(
          (l) => Left(l),
          (r) {
            // _localStorageRepository.saveUser(LocalUserDetailModel(
            //     mobile: r?.mobile,
            //     userUid: r?.userUid,
            //     deviceToken: r?.deviceToken,
            //     registrationStep: 7,
            //     accountStatus: true));
            return Right(LocalUserEntities(
                mobile: r?.mobile,
                userUid: r?.userUid,
                deviceToken: r?.deviceToken,
                registrationStep: r?.registrationStep,
                accountStatus: r?.accountStatus));
          },
        );
      },
    );
  }
}
