import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../firebase_backend/api/api.dart';
import '../models/authentication_model/registration_five_req.dart';
import '../models/authentication_model/registration_four_req.dart';
import '../models/authentication_model/registration_one_req.dart';
import '../models/authentication_model/registration_three_req.dart';
import '../models/authentication_model/registration_two_req.dart';
import '../models/authentication_model/registration_zero_req.dart';

class FirebaseDataSource {
  FirebaseDataSource(this._api);
  final Api _api;
  final auth = FirebaseAuth.instance;
  final firstore = FirebaseFirestore.instance;
  Future<Map<String, dynamic>> loginUser({required String mobile}) async {
    return await _api.loginAPI(mobile: mobile);
  }

  Future<Map<String, dynamic>> verifyOtpAPI(RegistrationZeroReq data) async {
    return await _api.verifyOtpAPI(data);
  }

  Future<Map<String, dynamic>> registrationOneAPI(
          RegistrationOneReq data) async =>
      await _api.RegistrationOneAPI(data);

  Future<Map<String, dynamic>> registrationTwoAPI(
          RegistrationTwoReq data) async =>
      await _api.RegistrationTwoAPI(data);

  Future<Map<String, dynamic>> registrationThreeAPI(
          RegistrationThreeReq data) async =>
      await _api.RegistrationThreeAPI(data);

  Future<Map<String, dynamic>> registrationFourAPI(
          RegistrationFourReq data) async =>
      await _api.RegistrationFourAPI(data);
  Future<Map<String, dynamic>> registrationFiveAPI(
          RegistrationFiveReq data) async =>
      await _api.RegistrationFiveAPI(data);

  Future<Map<String, dynamic>> bankAPI() async => _api.BankAPI();

  Future<Map<String, dynamic>> stateAPI() async => _api.StateAPI();

  Future<Map<String, dynamic>> cityAPI(String stateId) async =>
      _api.CityAPI(stateId);
  Future<Map<String, dynamic>> uploadDocumentAPI(List<File> data) async =>
      _api.UploadDocumentAPI(data);

  Future<Map<String, dynamic>> getUserDetailApi() async =>
      _api.GetUserDetailApi();
}
