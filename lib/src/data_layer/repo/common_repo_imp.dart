import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/data_layer_exports.dart';
import '../../domain_layer/repositories/common_api_repository.dart';
import '../datasources/firbase_datasource.dart';
import '../models/common_api_model/bank_resp.dart';
import '../models/common_api_model/city_list_resp.dart';
import '../models/common_api_model/common_api_resp_model.dart';
import '../models/common_api_model/state_resp.dart';
import '../models/common_api_model/upload_doc_resp.dart';

class CommonRepositoryImp implements CommonApiRepository {
  CommonRepositoryImp(this._firebaseDataSource);
  final FirebaseDataSource _firebaseDataSource;
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  ResultFutureT<CommonApiResp<StateResp>> getStateRepo() async {
    try {
      return await _firebaseDataSource.stateAPI().then((value) {
        final res = CommonApiResp.fromJson(value, (p0) => null);
        if (res.statusCode == '200') {
          return Right(CommonApiResp<StateResp>.fromJson(
              value,
              (dataJson) =>
                  dataJson != null ? StateResp.fromJson(dataJson) : null));
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

  @override
  ResultFutureT<CommonApiResp<CityResp>> getCityRepo(String id) async {
    try {
      return await _firebaseDataSource.cityAPI(id).then((value) {
        final res = CommonApiResp.fromJson(value, (p0) => null);
        if (res.statusCode == '200') {
          return Right(CommonApiResp<CityResp>.fromJson(
              value,
              (dataJson) =>
                  dataJson != null ? CityResp.fromJson(dataJson) : null));
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

  @override
  ResultFutureT<CommonApiResp<BankResp>> getBanksRepo() async {
    try {
      return await _firebaseDataSource.bankAPI().then((value) {
        final res = CommonApiResp.fromJson(value, (p0) => null);
        if (res.statusCode == '200') {
          return Right(CommonApiResp<BankResp>.fromJson(
              value,
              (dataJson) =>
                  dataJson != null ? BankResp.fromJson(dataJson) : null));
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

  @override
  ResultFutureT<CommonApiResp<UploadDocResp>> uploadDocRepo(
      List<File> data) async {
    try {
      return await _firebaseDataSource.uploadDocumentAPI(data).then(
        (value) {
          final res = CommonApiResp.fromJson(value, (p0) => null);
          if (res.statusCode == '200') {
            return Right(CommonApiResp.fromJson(
              value,
              (p0) => p0 != null ? UploadDocResp.fromJson(p0) : null,
            ));
          } else {
            throw APIException(message: res.msg, code: res.statusCode);
          }
        },
      );
    } on APIException catch (e) {
      Log.error(e);
      return Left(ApiFailure.fromException(e));
    } catch (e) {
      Log.error(e);
      return Left(OtherFailure.fromException(e));
    }
  }
}
