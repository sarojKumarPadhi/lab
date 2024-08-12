// import 'dart:async';
// import 'dart:io';

// import 'package:location/location.dart';

// import '../../../../core/data_layer_exports.dart';
// import '../../../../core/utils/enums.dart';
// import '../../../data_layer/services/location_service.dart';
// import '../../repositories/common_api_repository.dart';

// class LocationPermissionUsecase implements UsecaseWithParams<String, bool> {
//   LocationPermissionUsecase(this._locationService, this._commonApiRepository);
//   final LocationService _locationService;
//   final CommonApiRepository _commonApiRepository;
//   late StreamSubscription<LocationData> _locationSubscription;
//   @override
//   ResultFutureT<String> call(bool? dutyStatus) async {
//     return await requestLocationPermission().then(
//       (value) => value.fold(
//         (l) => Left(l),
//         (r) async {
//           final locationData = await _locationService.getCurrentLocation();
//           if (dutyStatus ?? false) {
//             startTracking();
//           } else if (dutyStatus == false) {
//             final res = await stopTracking();

//             if (res.isLeft()) {
//               return res.fold(
//                 (l) => Left(l),
//                 (r) => const Right("_r"),
//               );
//             }
//           }
//           return Right(await _locationService.getAddressName(
//               locationData.latitude ?? 0.0, locationData.longitude ?? 0.0));
//         },
//       ),
//     );
//   }

//   ResultFutureT<bool> requestLocationPermission() async {
//     final location = Location.instance;
//     var status = await location.hasPermission();
//     if (Platform.isAndroid) {
//       if (status == PermissionStatus.denied) {
//         status = await location.requestPermission();
//         if (status == PermissionStatus.denied) {
//           return Left(OtherFailure(
//               message: "Please Allow Location Permission In App Settings",
//               code: PermissionExceptiontype.locationDenied.name));
//         }
//       }
//       if (status == PermissionStatus.deniedForever) {
//         return Left(OtherFailure(
//             message: "Please Allow Location Permission In App Settings",
//             code: PermissionExceptiontype.locationAlwaysDenied.name));
//       } else if (status == PermissionStatus.granted) {
//         var status = await location.requestService();
//         if (status) {
//           return const Right(true);
//         } else {
//           return Left(OtherFailure(
//               message: "Enable Location For Getting Nearest Ride",
//               code: PermissionExceptiontype.locationServiceDenied.name));
//         }
//       }
//     }

//     ///! For IOS Location  Permission
//     else if (Platform.isIOS) {
//       if (status == PermissionStatus.denied) {
//         status = await location.requestPermission();
//         status == PermissionStatus.denied
//             ? status = await location.requestPermission()
//             : null;
//       }
//       if (status == PermissionStatus.grantedLimited) {}
//       if (status == PermissionStatus.deniedForever) {
//         return const Left(OtherFailure(
//             message: "Please Allow Location Permission In App Settings",
//             code: 'location-permission'));
//       } else if (status == PermissionStatus.granted) {
//         var status = await location.requestService();
//         if (status) {
//           return const Right(true);
//         } else {
//           return Left(OtherFailure(
//               message: "Enable Location For Getting Nearest Ride",
//               code: PermissionExceptiontype.locationServiceDenied.name));
//         }
//       }
//     }
//     return const Right(false);
//   }




// }
