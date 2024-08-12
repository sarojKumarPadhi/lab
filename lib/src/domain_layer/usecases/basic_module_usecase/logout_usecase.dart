import 'package:firebase_auth/firebase_auth.dart';

import '../../repositories/local_storage_repository.dart';

class LogoutUsecase {
  LogoutUsecase(this._localStorageRepository);

  final LocalStorageRepository _localStorageRepository;

  Future<bool> call() async {
    await FirebaseAuth.instance.signOut();
    await _localStorageRepository.clear();
    return true;
  }
}
