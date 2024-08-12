import 'package:get_storage/get_storage.dart';

import '../../../../core/utils/constants.dart';

class LocalDataSource {
  final data = GetStorage();

  void clear() {
    data.erase();
  }

  Future<Map<String, dynamic>?> getUser() async {
    return data.read<Map<String, dynamic>?>(Constants.userDetail);
  }

  Future<void> saveUser(Map<String, dynamic>? user) async {
    Map<String, dynamic>? detail =
        data.read<Map<String, dynamic>?>(Constants.userDetail);
    if (user != null && detail != null) {
      detail.forEach((key, value) =>
          user.containsKey(key) == true ? detail![key] = user[key] : null);
    } else if (detail == null) {
      detail = user;
    } else {
      detail = null;
    }

    await data.write(Constants.userDetail, detail);
  }
}
