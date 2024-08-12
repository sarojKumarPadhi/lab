import '../../../core/data_layer_exports.dart';
import '../../domain_layer/repositories/authentication_repository.dart';
import '../datasources/firbase_datasource.dart';
import '../models/authentication_model/login_resp.dart';
import '../models/authentication_model/registration_five_req.dart';
import '../models/authentication_model/registration_four_req.dart';
import '../models/authentication_model/registration_one_req.dart';
import '../models/authentication_model/registration_three_req.dart';
import '../models/authentication_model/registration_two_req.dart';
import '../models/authentication_model/registration_zero_req.dart';
import '../models/authentication_model/registration_zero_resp.dart';
import '../models/common_api_model/common_api_resp_model.dart';

class AuthenticationRepositoryImp implements AuthenticationRepository {
  AuthenticationRepositoryImp(this._firebaseDataSource);
  final FirebaseDataSource _firebaseDataSource;

  @override
  ResultFutureT<CommonApiResp<LoginResp>> loginUser(
      {required String mobile}) async {
    try {
      return await _firebaseDataSource.loginUser(mobile: mobile).then(
        (value) {
          final res = CommonApiResp.fromJson(value, (p0) => null);
          if (res.statusCode == '200') {
            return Right(CommonApiResp.fromJson(
                value, (p0) => p0 != null ? LoginResp.fromJson(p0) : null));
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

  @override
  ResultFutureT<CommonApiResp<RegistrationZeroResp?>> verifyOtp(
      RegistrationZeroReq data) async {
    try {
      return await _firebaseDataSource.verifyOtpAPI(data).then((value) {
        final res = CommonApiResp.fromJson(value, (p0) => null);
        if (res.statusCode == '200') {
          return Right(
            CommonApiResp<RegistrationZeroResp?>.fromJson(value,
                (p0) => p0 != null ? RegistrationZeroResp.fromJson(p0) : null),
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

  @override
  ResultFutureT<CommonApiResp<Null>> regiStepOneRepo(
      RegistrationOneReq data) async {
    try {
      return await _firebaseDataSource.registrationOneAPI(data).then((value) {
        final res = CommonApiResp.fromJson(value, (p0) => null);
        if (res.statusCode == '200') {
          return Right(
            CommonApiResp<Null>.fromJson(value, (p0) => null),
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

  @override
  ResultFutureT<CommonApiResp<Null>> regiStepTwoRepo(
      RegistrationTwoReq data) async {
    try {
      return await _firebaseDataSource.registrationTwoAPI(data).then((value) {
        final res = CommonApiResp.fromJson(value, (p0) => null);
        if (res.statusCode == '200') {
          return Right(
            CommonApiResp<Null>.fromJson(value, (p0) => null),
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

  @override
  ResultFutureT<CommonApiResp<Null>> regiStepThreeRepo(
      RegistrationThreeReq data) async {
    try {
      return await _firebaseDataSource.registrationThreeAPI(data).then((value) {
        final res = CommonApiResp.fromJson(value, (p0) => null);
        if (res.statusCode == '200') {
          return Right(
            CommonApiResp<Null>.fromJson(value, (p0) => null),
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

  @override
  ResultFutureT<CommonApiResp<Null>> regiStepFourRepo(
      RegistrationFourReq data) async {
    try {
      return await _firebaseDataSource.registrationFourAPI(data).then((value) {
        final res = CommonApiResp.fromJson(value, (p0) => null);
        if (res.statusCode == '200') {
          return Right(
            CommonApiResp<Null>.fromJson(value, (p0) => null),
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

  @override
  ResultFutureT<CommonApiResp<Null>> regiStepFiveRepo(
      RegistrationFiveReq data) async {
    try {
      return await _firebaseDataSource.registrationFiveAPI(data).then((value) {
        final res = CommonApiResp.fromJson(value, (p0) => null);
        if (res.statusCode == '200') {
          return Right(
            CommonApiResp<Null>.fromJson(value, (p0) => null),
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
