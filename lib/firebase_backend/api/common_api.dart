// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import '../../core/utils/logger.dart';
import '../core/errors/exceptions.dart';
import '../core/errors/failure.dart';
import '../core/utils/common_firebase_resp.dart';
import '../core/utils/firebase_constant.dart';
import 'data_base_config.dart';

mixin CommonAPI on DataBaseConfig {
  Future<Map<String, dynamic>> BankAPI() async {
    try {
      final bankCollection =
          firstore.collection(FirebaseConstant.BANK_COLLECTION);

      final bankList = await bankCollection.get().then((value) => value.docs
          .map(
            (e) => e.data(),
          )
          .toList());
      return firebaseCommonResp({"bankList": bankList});
    } on ApiException catch (e) {
      Log.error(e);
      return ApiFailure.fromException(e);
    } catch (e) {
      Log.error(e);
      return ServerFailure.fromException();
    }
  }

  Future<Map<String, dynamic>> StateAPI() async {
    try {
      final stateTable = firstore.collection(FirebaseConstant.STATE_COLLECTION);
      final stateList = await stateTable.get().then((value) => value.docs
          .map(
            (e) => e.data(),
          )
          .toList());
      return firebaseCommonResp({"stateList": stateList});
    } on ApiException catch (e) {
      Log.error(e);
      return ApiFailure.fromException(e);
    } catch (e) {
      Log.error(e);
      return ServerFailure.fromException();
    }
  }

  Future<Map<String, dynamic>> CityAPI(String stateId) async {
    try {
      final cityCollection = firstore
          .collection(FirebaseConstant.STATE_COLLECTION)
          .doc(stateId)
          .collection(FirebaseConstant.CITY_COLLECTION);
      final cityList = await cityCollection.get().then(
            (value) => value.docs.map((e) => e.data()).toList(),
          );
      return firebaseCommonResp({"cityList": cityList});
    } on ApiException catch (e) {
      Log.error(e);
      return ApiFailure.fromException(e);
    } catch (e) {
      Log.error(e);
      return ServerFailure.fromException();
    }
  }

  Future<Map<String, dynamic>> UploadDocumentAPI(List<File> data) async {
    try {
      String? uid = auth.currentUser!.uid;
      List<String> urlList = [];
      final firebaseStorage = FirebaseStorage.instance;
      for (var i = 0; i < data.length; i++) {
        final ref = firebaseStorage.ref().child('rider/$uid/${DateTime.now()}');
        var a = await ref.putFile(
          data[i],
        );
        urlList.add(a.ref.fullPath);
      }

      return firebaseCommonResp({'url': urlList});
    } on ApiException catch (e) {
      Log.error(e);
      return ApiFailure.fromException(e);
    } catch (e) {
      Log.error(e);
      return ServerFailure.fromException();
    }
  }
}
