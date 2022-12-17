import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_map_test_task/utils/navigate_current_location.dart';
import 'package:google_map_test_task/utils/random_location.dart';
import 'package:google_map_test_task/views/home_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class HomeViewModel extends State<HomePage> {
  final Completer<GoogleMapController> googleMapController = Completer();

  late final Future<Position> currentPositionFuture;

  List<LatLng> visitedLocations = [];
  @override
  void initState() {
    super.initState();
    currentPositionFuture = determineCurrentPosition();
  }

  // this function navigates to a random location on the map when the button is pressed
  Future<void> navigateToRandomLocation() async {
    LatLng randomLocation = getRandomCoordinate();

    final GoogleMapController controller = await googleMapController.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: randomLocation,
      zoom: 10,
    )));
    visitedLocations.add(randomLocation);
  }

  Future<void> navigateToLocation(LatLng location) async {
    final GoogleMapController controller = await googleMapController.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: location,
      zoom: 14,
    )));
  }
}
