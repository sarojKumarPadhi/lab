import 'dart:io';
import '../../../core/utils/typedef.dart';
import '../../data_layer/models/common_api_model/bank_resp.dart';
import '../../data_layer/models/common_api_model/city_list_resp.dart';
import '../../data_layer/models/common_api_model/common_api_resp_model.dart';

import '../../data_layer/models/common_api_model/state_resp.dart';
import '../../data_layer/models/common_api_model/upload_doc_resp.dart';

abstract class CommonApiRepository {
  const CommonApiRepository();

  ResultFutureT<CommonApiResp<StateResp>> getStateRepo();
  ResultFutureT<CommonApiResp<CityResp>> getCityRepo(String id);
  ResultFutureT<CommonApiResp<BankResp>> getBanksRepo();
  ResultFutureT<CommonApiResp<UploadDocResp>> uploadDocRepo(List<File> data);
}
