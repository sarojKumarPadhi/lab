import 'package:dartz/dartz.dart';

import '../../src/data_layer/models/common_api_model/common_api_resp_model.dart';
import '../../src/domain_layer/entities/common_usecase_entites/common_entities.dart';
import '../errors/failure.dart';

typedef ResultFutureT<T> = Future<Either<Failure, T>>;

typedef ResultVoid = ResultFutureT<void>;
typedef ResultCommonResp<T> = Future<CommonApiResp<T?>>;
typedef ResultCommonEntites<T> = ResultFutureT<CommonEntites<T?>>;
