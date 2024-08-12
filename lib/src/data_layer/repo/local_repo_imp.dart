import '../../../core/data_layer_exports.dart';

import '../../domain_layer/repositories/local_storage_repository.dart';
import '../datasources/local_data_source.dart';
import '../models/common_api_model/local_user_detail_model.dart';

class LocalRepoImp implements LocalStorageRepository {
  const LocalRepoImp(this._localDataSource);
  final LocalDataSource _localDataSource;

  @override
  ResultVoid clear() {
    _localDataSource.clear();
    throw UnimplementedError();
  }

  @override
  ResultFutureT<LocalUserDetailModel?> getUser() async {
    try {
      return _localDataSource.getUser().then(
            (value) => Right(
                value != null ? LocalUserDetailModel.fromJson(value) : null),
          );
    } on LocalException catch (e) {
      return Left(LocalFailure.fromException(e));
    }
  }

  @override
  ResultVoid saveUser(LocalUserDetailModel? user) async {
    try {
      return Right(
        await _localDataSource.saveUser(user?.toJson()),
      );
    } on LocalException catch (e) {
      return Left(LocalFailure.fromException(e));
    }
  }
}
