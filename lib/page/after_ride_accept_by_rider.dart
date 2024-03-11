import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../global/progressIndicator.dart';
import '../services/networkRequest.dart';

class AfterAcceptanceRidePage extends StatefulWidget {
  final String requestId;
  final String labUid;

  const AfterAcceptanceRidePage(
      {Key? key, required this.requestId, required this.labUid})
      : super(key: key);

  @override
  State<AfterAcceptanceRidePage> createState() =>
      _AfterAcceptanceRidePageState();
}

class _AfterAcceptanceRidePageState extends State<AfterAcceptanceRidePage> {
  LatLng? labLatLng;
  LatLng? riderLatLng;
  LatLng? patientLatLng;
  Set<Polyline> polyLineSet = {};
  List<LatLng> pLineCoordinatesList = [];
  BitmapDescriptor? customMarkerLabIcon;
  BitmapDescriptor? customMarkerPatientIcon;
  BitmapDescriptor? customMarkerRiderIcon;
  bool dataLoaded = false;
  String rideStatus = "accept";
  Set<Marker> setOfMarkers = <Marker>{};
  StreamSubscription<DatabaseEvent>? _driverLocationSubscription;

  @override
  void initState() {
    super.initState();
    getDataFromRealtime();
    createCustomMarker();
    listenToDriverLocationChanges();
  }

  @override
  void dispose() {
    _driverLocationSubscription?.cancel();
    super.dispose();
  }

  void createCustomMarker() async {
    customMarkerLabIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(10, 10)),
        "assets/icon/labLocation.png");
    customMarkerPatientIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(10, 10)),
        "assets/icon/patientIcon.png");
    customMarkerRiderIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(10, 10)), "assets/icon/rider.png");
  }

  void listenToDriverLocationChanges() {
    _driverLocationSubscription = FirebaseDatabase.instance
        .ref()
        .child(
            "active_labs/${widget.labUid}/${widget.requestId}/driverLocation")
        .onValue
        .listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;
      if (dataSnapshot.value != null) {
        Map<dynamic, dynamic> dataSnapshotValue =
            dataSnapshot.value as Map<dynamic, dynamic>;
        // Access specific values from the driver location
        double latitude = dataSnapshotValue['latitude'];
        double longitude = dataSnapshotValue['longitude'];
        // Print or use the latitude and longitude
        LatLng newPosition = LatLng(latitude, longitude);
        Marker marker = Marker(
          markerId: const MarkerId(
            "new_marker",
          ),
          position: newPosition,
          icon: customMarkerRiderIcon!,
          infoWindow: const InfoWindow(title: "Driver"),
        );
        setOfMarkers.removeWhere(
                (element) => element.markerId == const MarkerId("new_marker"));
        setOfMarkers.add(marker);
        setState(() {

        });
      }
    });
  }

  Future<void> getDataFromRealtime() async {
    final dataSnapshot = await FirebaseDatabase.instance
        .ref()
        .child("active_labs/${widget.labUid}/${widget.requestId}")
        .once();

    if (dataSnapshot.snapshot.value != null) {
      final dataSnap = dataSnapshot.snapshot.value as Map<dynamic, dynamic>;

      riderLatLng = LatLng(dataSnap["driverInitialLocation"]["initialLatitude"],
          dataSnap["driverInitialLocation"]["initialLongitude"]);
      labLatLng = LatLng(dataSnap["labDetails"]["latitude"],
          dataSnap["labDetails"]["longitude"]);
      patientLatLng = LatLng(dataSnap["patientDetails"]["latitude"],
          dataSnap["patientDetails"]["longitude"]);
      rideStatus = dataSnap["rideStatus"];
      dataLoaded = true;

      getPolyline();
    } else {
      Fluttertoast.showToast(msg: "Data not found");
    }
  }

  Future<void> getPolyline() async {
    final directionInfoDetails =
        await obtainOriginToDestinationDirectionDetails(
            riderLatLng!, rideStatus == "accept" ? patientLatLng! : labLatLng!);

    if (directionInfoDetails != null) {
      final polylinePoints = PolylinePoints();
      final linePoints =
          polylinePoints.decodePolyline(directionInfoDetails.e_points!);
      pLineCoordinatesList.clear();
      for (final element in linePoints) {
        pLineCoordinatesList.add(LatLng(element.latitude, element.longitude));
      }

      final polyline = Polyline(
        polylineId: const PolylineId("PolylineID"),
        points: pLineCoordinatesList,
        color: Colors.black,
        width: 5,
      );
      polyLineSet.removeWhere(
          (element) => element.polylineId == const PolylineId("PolylineID"));
      polyLineSet.add(polyline);
      setState(() {});
    } else {
      Fluttertoast.showToast(msg: "Please choose a different location");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getDataFromRealtime();
        },
        child: const Icon(Icons.refresh),
      ),
      body: dataLoaded
          ? GoogleMap(
              initialCameraPosition: riderLatLng != null
                  ? CameraPosition(target: riderLatLng!, zoom: 14)
                  : const CameraPosition(target: LatLng(0, 0)),
              polylines: polyLineSet,
              markers: {
                Marker(
                  markerId: const MarkerId('lab_location'),
                  position: labLatLng!,
                  infoWindow: const InfoWindow(title: 'Lab Location'),
                  icon: customMarkerLabIcon!,
                ),
                Marker(
                  markerId: const MarkerId('patient_location'),
                  position: patientLatLng!,
                  infoWindow: const InfoWindow(title: 'Patient Location'),
                  icon: customMarkerPatientIcon!,
                ),
                ...setOfMarkers
              },
            )
          : const Center(child: CircularProgress()),
    );
  }
}