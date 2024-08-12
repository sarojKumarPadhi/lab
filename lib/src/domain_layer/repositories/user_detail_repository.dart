import '../../../core/data_layer_exports.dart';
import '../../data_layer/models/basic_api_model/user_detail_model.dart';
import '../../data_layer/models/common_api_model/common_api_resp_model.dart';

abstract class UserDetailRepository {
  ResultFutureT<CommonApiResp<UserDetailModel?>> getUserDetailRepo();
}
