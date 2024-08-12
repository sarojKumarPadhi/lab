import 'package:zonk_rider/src/domain_layer/usecases/authentication_usecase/registration_three_usecase.dart';

import '../../../../../core/app_exports.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../domain_layer/entities/common_usecase_entites/bank_entities.dart';
import '../../../../domain_layer/usecases/common_usecase/fetch_banks.dart';

class RegistrationThreeController extends GetxController {
  RegistrationThreeController(this._fetchBanks, this._registrationThreeUsecase);
  final FetchBanks _fetchBanks;

  final RegistrationThreeUsecase _registrationThreeUsecase;
  final formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  final bankName = TextEditingController();
  final branchName = TextEditingController();
  final accountNumber = TextEditingController();
  final confirmAccountNumber = TextEditingController();
  final ifscCode = TextEditingController();

  RxList<BankEntites> bankList = <BankEntites>[].obs;
  BankEntites? selectedBank;
  @override
  void onInit() {
    getBankList();
    super.onInit();
  }

  void onBankSelect(int index) {
    bankName.text = bankList[index].name;
    selectedBank = bankList[index];
    Get.back();
  }

  Future<void> getBankList() async {
    await _fetchBanks().then(
      (value) {
        value.fold(
          (l) {
            snackbar(title: l.message, message: l.code, type: MsgType.failure);
          },
          (r) {
            bankList(r);
          },
        );
      },
    );
  }

  Future<void> regiStepThreeSet() async {
    isLoading(true);
    await _registrationThreeUsecase
        .call(RegistrationThreeParams(
            accountNumber: accountNumber.text,
            bankName: selectedBank?.id ?? "N?A",
            branchName: branchName.text,
            ifscCode: ifscCode.text,
            reAccountNumber: accountNumber.text))
        .then(
      (value) {
        value.fold(
          (l) => snackbar(
              title: l.message, message: l.message, type: MsgType.failure),
          (r) {
            Get.offNamed(AppRoutes.REG_STEP_FOUR_SCREEN);
          },
        );
      },
    );
    isLoading(false);
  }
}
