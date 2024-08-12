import '../../../../core/data_layer_exports.dart';
import '../../../data_layer/models/common_api_model/local_user_detail_model.dart';
import '../../entities/user_detail_entities.dart';
import '../../repositories/local_storage_repository.dart';
import '../../repositories/user_detail_repository.dart';

class GetUserDetailUsecase implements UsecaseWithoutParams<UserDetailEntities> {
  GetUserDetailUsecase(
      this._userDetailRepository, this._localStorageRepository);
  final UserDetailRepository _userDetailRepository;
  final LocalStorageRepository _localStorageRepository;
  @override
  ResultFutureT<UserDetailEntities> call() async {
    return await _userDetailRepository.getUserDetailRepo().then(
      (value) {
        return value.fold(
          (l) => Left(l),
          (r) {
            _localStorageRepository.saveUser(LocalUserDetailModel(
              accountStatus: r.data?.accountStatus ?? false,
              deviceToken: r.data?.deviceToken,
              mobile: r.data?.phoneNumber ?? "N/A",
              registrationStep: r.data?.registrationStep ?? 0,
            ));
            return Right(
              UserDetailEntities(
                  phoneNumber: r.data?.phoneNumber ?? "N/A",
                  deviceToken: r.data?.deviceToken ?? "N/A",
                  registrationStep: r.data?.registrationStep ?? 0,
                  accountStatus: r.data?.accountStatus ?? false,
                  country: r.data?.address?.country ?? "N/A",
                  state: r.data?.address?.state?.name ?? "N/A",
                  district: r.data?.address?.district?.name ?? "N/A",
                  city: r.data?.address?.city ?? "N/A",
                  pinCode: r.data?.address?.pinCode ?? "N/A",
                  accountNumber: r.data?.bankDetails?.accountNumber ?? "N/A",
                  ifscCode: r.data?.bankDetails?.ifscCode ?? "N/A",
                  bankName: r.data?.bankDetails?.bankName?.name ?? "N/A",
                  branchName: r.data?.bankDetails?.branchName ?? "N/A",
                  name: r.data?.basicDetails?.name ?? "N/A",
                  age: r.data?.basicDetails?.age ?? "N/A",
                  gender: r.data?.basicDetails?.gender ?? "N/A",
                  aadhar: r.data?.documentVerification?.aadhar ?? false,
                  bankPassbook:
                      r.data?.documentVerification?.bankPassbook ?? false,
                  bike: r.data?.documentVerification?.bike ?? false,
                  educationCertificate:
                      r.data?.documentVerification?.educationCertificate ??
                          false,
                  panCard: r.data?.documentVerification?.panCard ?? false,
                  selfie: r.data?.documentVerification?.selfie ?? false,
                  aadharUrl: r.data?.documentUrl?.aadharUrl ?? "N/A",
                  bankPassbookUrl:
                      r.data?.documentUrl?.bankPassbookUrl ?? "N/A",
                  bikeUrl1: r.data?.documentUrl?.bikeUrl1 ?? "N/A",
                  bikeUrl2: r.data?.documentUrl?.bikeUrl2 ?? "N/A",
                  educationCertificateUrl:
                      r.data?.documentUrl?.educationCertificateUrl ?? "N/A",
                  panCardUrl: r.data?.documentUrl?.panCardUrl ?? "N/A",
                  selfie1Url: r.data?.documentUrl?.selfie1Url,
                  selfie2Url: r.data?.documentUrl?.selfie2Url ?? "N/A"),
            );
          },
        );
      },
    );
  }
}
