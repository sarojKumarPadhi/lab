import 'auth_api.dart';
import 'basic_api.dart';
import 'common_api.dart';
import 'data_base_config.dart';

class Api with DataBaseConfig, AuthAPI, CommonAPI, BasicAPI {}
