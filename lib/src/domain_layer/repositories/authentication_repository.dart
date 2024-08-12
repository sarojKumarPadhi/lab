import '../../../core/utils/typedef.dart';
import '../../data_layer/models/authentication_model/login_resp.dart';
import '../../data_layer/models/authentication_model/registration_one_req.dart';
import '../../data_layer/models/authentication_model/registration_zero_req.dart';
import '../../data_layer/models/common_api_model/common_api_resp_model.dart';
import '../../data_layer/models/authentication_model/registration_five_req.dart';
import '../../data_layer/models/authentication_model/registration_four_req.dart';
import '../../data_layer/models/authentication_model/registration_three_req.dart';
import '../../data_layer/models/authentication_model/registration_two_req.dart';
import '../../data_layer/models/authentication_model/registration_zero_resp.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository();

  ResultFutureT<CommonApiResp<LoginResp>> loginUser({
    required String mobile,
  });
  ResultFutureT<CommonApiResp<RegistrationZeroResp?>> verifyOtp(
      RegistrationZeroReq data);
  ResultFutureT<CommonApiResp<Null>> regiStepOneRepo(RegistrationOneReq data);
  ResultFutureT<CommonApiResp<Null>> regiStepTwoRepo(RegistrationTwoReq data);
  ResultFutureT<CommonApiResp<Null>> regiStepThreeRepo(
      RegistrationThreeReq data);
  ResultFutureT<CommonApiResp<Null>> regiStepFourRepo(RegistrationFourReq data);
  ResultFutureT<CommonApiResp<Null>> regiStepFiveRepo(RegistrationFiveReq data);
}
