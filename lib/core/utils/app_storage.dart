import 'package:get_storage/get_storage.dart';

import 'constants.dart';

class AppStorage {
  Future<void> init() async {
    data = GetStorage();
  }

  static late GetStorage data;

  static void setIsRideAccept(bool status) =>
      data.write(Constants.isRideAccept, status);
  static bool get getIsRideAccept => data.read(Constants.isRideAccept) ?? false;
}
