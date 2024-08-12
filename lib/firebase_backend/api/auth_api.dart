// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:jonk_lab/src/data_layer/models/authentication_model/registration_five_req.dart';
import 'package:jonk_lab/src/data_layer/models/authentication_model/registration_four_req.dart';
import 'package:jonk_lab/src/data_layer/models/authentication_model/registration_one_req.dart';
import 'package:jonk_lab/src/data_layer/models/authentication_model/registration_three_req.dart';
import 'package:jonk_lab/src/data_layer/models/authentication_model/registration_two_req.dart';
import '../../core/utils/logger.dart';
import '../../src/data_layer/models/authentication_model/registration_zero_req.dart';
import '../core/errors/exceptions.dart';
import '../core/errors/failure.dart';
import '../core/utils/common_firebase_resp.dart';
import '../core/utils/firebase_constant.dart';
import '../object_relation_models/collection_model/lab_model.dart';
import 'data_base_config.dart';

mixin AuthAPI on DataBaseConfig {
  Future<Map<String, dynamic>> loginAPI({required String mobile}) async {
    Completer<Map<String, dynamic>> completer =
        Completer<Map<String, dynamic>>();
    try {
      //! OTP Verification
      // await FirebaseAuth.instance.verifyPhoneNumber(
      //   phoneNumber: '+91$mobile',
      //   verificationCompleted: (PhoneAuthCredential credential) {},
      //   verificationFailed: (FirebaseAuthException exception) {
      //     completer.completeError(FireBaseException(
      //         message: exception.message ?? "Unknown Error Occur",
      //         code: exception.code));
      //   },
      //   codeSent: (String verificationId, int? resendToken) {
      //     completer.complete(firebaseCommonResp(
      //         {"verificationId": verificationId, "resendToken": resendToken}));
      //   },
      //   codeAutoRetrievalTimeout: (String verificationId) {},
      // );
      completer.complete(firebaseCommonResp(
          {"verificationId": "123456", "resendToken": 123456}));
      return await completer.future;
    } on FireBaseException catch (e) {
      return FireBaseAuthFailure.fromException(e);
    } on ApiException catch (e) {
      Log.error(e);
      return ApiFailure.fromException(e);
    } catch (e) {
      Log.error(e);
      return ServerFailure.fromException();
    }
  }

  Future<Map<String, dynamic>> verifyOtpAPI(RegistrationZeroReq data) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: data.verificationId, smsCode: data.otp);
      //! OTP Verification Is Stop

      // await auth.signInWithCredential(credential);
      // String? uid = auth.currentUser!.uid;
      // Log.debug("User Id: $uid");

      String? uid = "HBffyyFJdwZXJwyLkC64LZ7HQJF3";

      final riderTable =
          firstore.collection(FirebaseConstant.LAB_COLLECTION).doc(uid);
      return await riderTable.get().then(
        (value) async {
          String? deviceToken = await FirebaseMessaging.instance.getToken();
          final userDetail = value.data() != null
              ? LabCollectionModel.fromJson(value.data()!)
              : null;

          if (userDetail == null) {
            await riderTable.set(
                LabCollectionModel(
                        registrationStep: 1,
                        accountStatus: false,
                        phoneNumber: data.phoneNumber,
                        visibleStatus: false,
                        userUid: uid,
                        deviceToken: deviceToken)
                    .toJson(),
                SetOptions(merge: true));
            return firebaseCommonResp({
              "registrationStep": 1,
              "accountStatus": false,
              "phoneNumber": data.phoneNumber,
              "visibleStatus": false,
              "userUid": uid,
              "deviceToken": deviceToken
            });
          } else if (userDetail.registrationStep == null ||
              userDetail.accountStatus == null) {
            await riderTable.set(
                LabCollectionModel(
                        registrationStep: 1,
                        accountStatus: false,
                        phoneNumber: data.phoneNumber,
                        visibleStatus: false,
                        userUid: uid,
                        deviceToken: deviceToken)
                    .toJson(),
                SetOptions(merge: true));
            return firebaseCommonResp({
              "registrationStep": 1,
              "accountStatus": false,
              "phoneNumber": data.phoneNumber,
              "visibleStatus": false,
              "userUid": uid,
              "deviceToken": deviceToken
            });
          } else {
            await riderTable.set(
                LabCollectionModel(deviceToken: deviceToken).toJson(),
                SetOptions(merge: true));
            return firebaseCommonResp({
              "registrationStep": userDetail.registrationStep ?? 1,
              "accountStatus": userDetail.accountStatus ?? false,
              "phoneNumber": data.phoneNumber,
              "visibleStatus": false,
              "userUid": uid,
              "deviceToken": deviceToken
            });
          }
        },
      );
    } on FireBaseException catch (e) {
      Log.error(e);
      return FireBaseAuthFailure.fromException(e);
    } on ApiException catch (e) {
      Log.error(e);
      return ApiFailure.fromException(e);
    } catch (e) {
      Log.error(e);
      return ServerFailure.fromException();
    }
  }

  Future<Map<String, dynamic>> RegistrationOneAPI(
      RegistrationOneReq data) async {
    try {
      //String? uid = auth.currentUser!.uid;
      String? uid = "HBffyyFJdwZXJwyLkC64LZ7HQJF3";
      final riderTable =
          firstore.collection(FirebaseConstant.LAB_COLLECTION).doc(uid);
      return await riderTable.get().then(
        (value) async {
          final userDetail = value.data() != null
              ? LabCollectionModel.fromJson(value.data()!)
              : null;
          if (userDetail?.registrationStep == 1 ||
              userDetail?.registrationStep == null) {
            await riderTable.set(
                LabCollectionModel(
                        registrationStep: 2,
                        basicDetails: BasicDetails(
                            labName: data.labName,
                            labOwnerName: data.labOwnerName,
                            labRegistrationNumber: data.labRegistrationNumber))
                    .toJson(),
                SetOptions(merge: true));
            return firebaseCommonResp(null);
          } else {
            return firebaseCommonResp(null,
                msg:
                    "Data Not Found Current Step:  ${(userDetail?.registrationStep ?? 1)}",
                statusCode: "403");
          }
        },
      );
    } on ApiException catch (e) {
      Log.error(e);
      return ApiFailure.fromException(e);
    } catch (e) {
      Log.error(e);
      return ServerFailure.fromException();
    }
  }

  Future<Map<String, dynamic>> RegistrationTwoAPI(
      RegistrationTwoReq data) async {
    try {
      // String? uid = auth.currentUser!.uid;
      String? uid = "HBffyyFJdwZXJwyLkC64LZ7HQJF3";
      if (data.latitude == null || data.longitude == null) {
        return firebaseCommonResp(null,
            statusCode: '400',
            msg: "Location Latitude and Longitude is Required");
      } else {
        final riderTable =
            firstore.collection(FirebaseConstant.LAB_COLLECTION).doc(uid);
        return await riderTable.get().then(
          (value) async {
            final userDetail = value.data() != null
                ? LabCollectionModel.fromJson(value.data()!)
                : null;
            if (userDetail?.registrationStep == 2) {
              final stateDoc = firstore
                  .collection(FirebaseConstant.STATE_COLLECTION)
                  .doc(data.state);
              final distDoc = firstore
                  .collection(FirebaseConstant.STATE_COLLECTION)
                  .doc(data.state)
                  .collection(FirebaseConstant.CITY_COLLECTION)
                  .doc(data.district);

              final reqParam = data.toJson();
              reqParam.update(
                'state',
                (value) => stateDoc,
              );
              reqParam.update(
                'district',
                (value) => distDoc,
              );
              await riderTable.set(
                  LabCollectionModel(
                          registrationStep: 3,
                          address: Address(
                              city: data.city,
                              country: data.city,
                              pinCode: data.pinCode,
                              district: distDoc,
                              state: stateDoc,
                              latLong:
                                  GeoPoint(data.latitude!, data.longitude!)))
                      .toJson(),
                  SetOptions(merge: true));
              return firebaseCommonResp(null);
            } else {
              return firebaseCommonResp(null,
                  msg:
                      "Data Not Found Current Step:  ${(value.data()?['registrationStep'] ?? 1)}",
                  statusCode: "403");
            }
          },
        );
      }
    } on ApiException catch (e) {
      Log.error(e);
      return ApiFailure.fromException(e);
    } catch (e) {
      Log.error(e);
      return ServerFailure.fromException();
    }
  }

  Future<Map<String, dynamic>> RegistrationThreeAPI(
      RegistrationThreeReq data) async {
    try {
      // String? uid = auth.currentUser!.uid;
      String? uid = "HBffyyFJdwZXJwyLkC64LZ7HQJF3";
      final riderTable =
          firstore.collection(FirebaseConstant.LAB_COLLECTION).doc(uid);
      return await riderTable.get().then(
        (value) async {
          final userDetail = value.data() != null
              ? LabCollectionModel.fromJson(value.data()!)
              : null;
          if (userDetail?.registrationStep == 3) {
            final bankRef = firstore
                .collection(FirebaseConstant.BANK_COLLECTION)
                .doc(data.bankId);
            await riderTable.set(
                LabCollectionModel(
                        registrationStep: 4,
                        bankDetails: BankDetails(
                            accountNumber: data.accountNumber,
                            branchName: data.branchName,
                            ifscCode: data.ifscCode,
                            bankName: bankRef))
                    .toJson(),
                SetOptions(merge: true));
            return firebaseCommonResp(null);
          } else {
            return firebaseCommonResp(null,
                msg:
                    "Data Not Found Current Step:  ${(userDetail?.registrationStep ?? 1)}",
                statusCode: "403");
          }
        },
      );
    } on ApiException catch (e) {
      Log.error(e);
      return ApiFailure.fromException(e);
    } catch (e) {
      Log.error(e);
      return ServerFailure.fromException();
    }
  }

  Future<Map<String, dynamic>> RegistrationFourAPI(
      RegistrationFourReq reqParam) async {
    try {
      // String? uid = auth.currentUser!.uid;
      String? uid = "HBffyyFJdwZXJwyLkC64LZ7HQJF3";
      final riderTable =
          firstore.collection(FirebaseConstant.LAB_COLLECTION).doc(uid);
      return await riderTable.get().then(
        (value) async {
          final userDetail = value.data() != null
              ? LabCollectionModel.fromJson(value.data()!)
              : null;
          if (userDetail?.registrationStep == 4) {
            await riderTable.set(
                LabCollectionModel(
                    registrationStep: 5,
                    documentUrl: DocumentUrl(
                        aadharUrl: reqParam.aadharUrl,
                        bankPassBookUrl: reqParam.bankPassBookUrl,
                        labCertificateUrl: reqParam.labCertificateUrl,
                        panCardUrl: reqParam.panCardUrl),
                    documentVerification: DocumentVerification(
                      aadhar: false,
                      bankPassbook: false,
                      labCertificate: false,
                      panCard: false,
                    )).toJson(),
                SetOptions(merge: true));
            return firebaseCommonResp(null);
          } else {
            return firebaseCommonResp(null,
                msg:
                    "Data Not Found Current Step:  ${(userDetail?.registrationStep ?? 1)}",
                statusCode: "403");
          }
        },
      );
    } on ApiException catch (e) {
      Log.error(e);
      return ApiFailure.fromException(e);
    } catch (e) {
      Log.error(e);
      return ServerFailure.fromException();
    }
  }

  Future<Map<String, dynamic>> RegistrationFiveAPI(
      RegistrationFiveReq reqParam) async {
    try {
      if (reqParam.labPictureUrl == null || reqParam.labPictureUrl!.isEmpty) {
        return firebaseCommonResp(null,
            statusCode: '400', msg: "Lab Image is Required");
      }
      // String? uid = auth.currentUser!.uid;
      String? uid = "HBffyyFJdwZXJwyLkC64LZ7HQJF3";
      final riderTable =
          firstore.collection(FirebaseConstant.LAB_COLLECTION).doc(uid);
      return await riderTable.get().then(
        (value) async {
          final userDetail = value.data() != null
              ? LabCollectionModel.fromJson(value.data()!)
              : null;
          if (userDetail?.registrationStep == 5) {
            await riderTable.set(
                LabCollectionModel(
                        registrationStep: 6,
                        documentUrl:
                            DocumentUrl(labPictureUrl: reqParam.labPictureUrl))
                    .toJson(),
                SetOptions(merge: true));
            return firebaseCommonResp(null);
          } else {
            return firebaseCommonResp(null,
                msg:
                    "Data Not Found Current Step:  ${(userDetail?.registrationStep ?? 1)}",
                statusCode: "403");
          }
        },
      );
    } on ApiException catch (e) {
      Log.error(e);
      return ApiFailure.fromException(e);
    } catch (e) {
      Log.error(e);
      return ServerFailure.fromException();
    }
  }
}
