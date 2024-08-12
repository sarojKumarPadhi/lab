import 'package:get/get.dart';
import '../../firebase_backend/api/api.dart';
import '../../src/data_layer/datasources/firbase_datasource.dart';
import '../../src/data_layer/datasources/local_data_source.dart';
import '../../src/data_layer/repo/auth_repo_imp.dart';
import '../../src/data_layer/repo/common_repo_imp.dart';
import '../../src/data_layer/repo/local_repo_imp.dart';
import '../../src/domain_layer/repositories/authentication_repository.dart';
import '../../src/domain_layer/repositories/common_api_repository.dart';
import '../../src/domain_layer/repositories/local_storage_repository.dart';
import 'logger.dart';

class InitialBiinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Log(), fenix: true);

    /// APi Dependency Injection
    Get.lazyPut(() => Api());

    /// Data Source Dependency Injection
    Get.lazyPut(() => LocalDataSource(), fenix: true);
    Get.lazyPut(() => FirebaseDataSource(Get.find<Api>()));

    /// Repository Dependency Injection

    Get.lazyPut<LocalStorageRepository>(
        () => LocalRepoImp(Get.find<LocalDataSource>()),
        fenix: true);

    Get.lazyPut<CommonApiRepository>(
        () => CommonRepositoryImp(Get.find<FirebaseDataSource>()),
        fenix: true);
    Get.lazyPut<AuthenticationRepository>(
        () => AuthenticationRepositoryImp(Get.find<FirebaseDataSource>()));
  }
}
