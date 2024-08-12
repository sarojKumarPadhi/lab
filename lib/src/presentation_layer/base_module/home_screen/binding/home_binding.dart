import 'package:get/get.dart';
import 'package:zonk_rider/src/data_layer/repo/user_detail_repo_imp.dart';
import 'package:zonk_rider/src/domain_layer/repositories/local_storage_repository.dart';
import '../../../../data_layer/datasources/firbase_datasource.dart';
import '../../../../data_layer/repo/common_repo_imp.dart';
import '../../../../data_layer/services/location_service.dart';
import '../../../../domain_layer/repositories/common_api_repository.dart';
import '../../../../domain_layer/usecases/basic_module_usecase/get_user_detail_usecase.dart';
import '../../../../domain_layer/usecases/basic_module_usecase/logout_usecase.dart';
import '../../../../domain_layer/usecases/services_usecase/location_permission_usecase.dart';
import '../../../../domain_layer/usecases/services_usecase/notification_permission_usecase.dart';
import '../controller/home_screen_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserDetailRepoImp(Get.find<FirebaseDataSource>()));
    Get.lazyPut(() => GetUserDetailUsecase(
        Get.find<UserDetailRepoImp>(), Get.find<LocalStorageRepository>()));
    Get.lazyPut(() => LogoutUsecase(Get.find<LocalStorageRepository>()));
    Get.lazyPut(() => LocationService());

    Get.lazyPut(() =>
        LocationPermissionUsecase(Get.find<LocationService>(), Get.find()));
    Get.lazyPut(() => LocationPermissionUsecase(
        Get.find<LocationService>(), Get.find<CommonApiRepository>()));

    Get.lazyPut(() => NotificationPermissionUsecase());

    Get.lazyPut(() => HomeScreenController(
        Get.find<GetUserDetailUsecase>(),
        Get.find<LogoutUsecase>(),
        Get.find<LocationPermissionUsecase>(),
        Get.find<NotificationPermissionUsecase>()));
  }
}
