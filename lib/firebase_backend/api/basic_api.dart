import '../../core/utils/logger.dart';
import '../core/errors/exceptions.dart';
import '../core/errors/failure.dart';
import 'data_base_config.dart';

mixin BasicAPI on DataBaseConfig {
  Future<Map<String, dynamic>> GetUserDetailApi() async {
    String? uid = auth.currentUser!.uid;
    try {
      return {};
    } on ApiException catch (e) {
      Log.error(e);
      return ApiFailure.fromException(e);
    } catch (e) {
      Log.error(e);
      return ServerFailure.fromException();
    }
  }
}
