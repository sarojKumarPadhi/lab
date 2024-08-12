import '../../../core/data_layer_exports.dart';
import '../../data_layer/models/common_api_model/local_user_detail_model.dart';

abstract class LocalStorageRepository {
  ResultVoid saveUser(LocalUserDetailModel? user);
  ResultFutureT<LocalUserDetailModel?> getUser();

  ResultVoid clear();
}
