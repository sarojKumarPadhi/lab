import '../../../../../core/app_exports.dart';
import '../../../../domain_layer/entities/common_usecase_entites/city_entities.dart';
import '../../../../domain_layer/entities/common_usecase_entites/state_entities.dart';
import '../../../../domain_layer/usecases/authentication_usecase/registration_two_usecase.dart';
import '../../../../domain_layer/usecases/common_usecase/fetch_city.dart';
import '../../../../domain_layer/usecases/common_usecase/fetch_state.dart';

class RegistrationTwoController extends GetxController {
  RegistrationTwoController(
      this._fetchState, this._fetchCity, this._registrationTwoUsecase);
  final FetchState _fetchState;
  final FetchCity _fetchCity;
  final RegistrationTwoUsecase _registrationTwoUsecase;
  final formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  TextEditingController pinCode = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController localityController = TextEditingController();

  RxList<StateEntities> stateList = <StateEntities>[].obs;
  StateEntities? selectedState;
  RxList<CityEntites> districtList = <CityEntites>[].obs;
  CityEntites? selectedDistrict;
  @override
  void onInit() {
    getState();
    super.onInit();
  }

  void onSelectState(int index) {
    selectedState =
        StateEntities(name: stateList[index].name, id: stateList[index].id);
    stateController.text = stateList[index].name;
    getCity(stateList[index].id);
    Get.back();
  }

  void onSelectCity(int index) {
    selectedDistrict = districtList[index];
    districtController.text = districtList[index].name;
    Get.back();
  }

  Future<void> getState() async {
    selectedDistrict = null;
    districtController.clear();
    formKey.currentState?.validate();
    districtList.clear();

    await _fetchState().then(
      (value) {
        value.fold(
          (l) {
            snackbar(title: l.message, message: l.code, type: MsgType.failure);
          },
          (r) {
            stateList(r);
          },
        );
      },
    );
  }

  Future<void> getCity(String id) async {
    await _fetchCity(id).then(
      (value) {
        value.fold(
          (l) {
            snackbar(title: l.message, message: l.code, type: MsgType.failure);
          },
          (r) {
            districtList(r);
          },
        );
      },
    );
  }

  Future<void> regTwoSet() async {
    isLoading(true);
    await _registrationTwoUsecase
        .call(RegistrationTwoParams(
            city: localityController.text,
            country: "India",
            district: selectedDistrict?.id ?? "0",
            pinCode: pinCode.text,
            state: selectedState!.id))
        .then(
      (value) {
        value.fold(
          (l) => snackbar(
              title: l.message, message: l.message, type: MsgType.failure),
          (r) {
            Get.offNamed(AppRoutes.REG_STEP_THREE_SCREEN);
          },
        );
      },
    );
    isLoading(false);
  }
}
