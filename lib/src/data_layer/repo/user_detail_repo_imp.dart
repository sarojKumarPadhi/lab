import '../../../core/data_layer_exports.dart';
import '../../domain_layer/repositories/user_detail_repository.dart';
import '../datasources/firbase_datasource.dart';
import '../models/basic_api_model/user_detail_model.dart';
import '../models/common_api_model/common_api_resp_model.dart';

class UserDetailRepoImp implements UserDetailRepository {
  UserDetailRepoImp(this._firebaseDataSource);
  final FirebaseDataSource _firebaseDataSource;
  @override
  ResultFutureT<CommonApiResp<UserDetailModel?>> getUserDetailRepo() async {
    try {
      return await _firebaseDataSource.getUserDetailApi().then((value) {
        final res = CommonApiResp.fromJson(value, (p0) => null);
        if (res.statusCode == '200') {
          return Right(
            CommonApiResp<UserDetailModel?>.fromJson(value,
                (p0) => p0 != null ? UserDetailModel.fromJson(p0) : null),
          );
        } else {
          throw APIException(message: res.msg, code: res.statusCode);
        }
      });
    } on APIException catch (e) {
      Log.error(e);
      return Left(ApiFailure.fromException(e));
    } catch (e) {
      Log.error(e);
      return Left(OtherFailure.fromException(e));
    }
  }
}
