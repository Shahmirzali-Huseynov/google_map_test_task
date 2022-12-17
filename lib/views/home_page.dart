import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_map_test_task/utils/dialog/visited_locations_dialog.dart';
import 'package:google_map_test_task/view_model/home_view_model.dart';
import 'package:google_map_test_task/views/widgets/button_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Position>(
          future: currentPositionFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }
            return Stack(
              children: [
                GoogleMap(
                  mapType: MapType.normal,
                  zoomControlsEnabled: true,
                  zoomGesturesEnabled: true,
                  myLocationButtonEnabled: false,
                  myLocationEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(snapshot.data!.latitude, snapshot.data!.longitude),
                    zoom: 15,
                  ),
                  onMapCreated: (controller) {
                    googleMapController.complete(controller);
                  },
                ),
                Positioned(
                  top: 70,
                  right: 10,
                  child: ButtonWidget(
                      onPressed: () async {
                        showVisitedLocationsDialog(
                          context: context,
                          visitedLocations: visitedLocations,
                          currentLocation: LatLng(snapshot.data!.latitude, snapshot.data!.longitude),
                        );
                      },
                      padding: const EdgeInsets.all(5),
                      buttonColor: const Color(0xFFFFFFFF),
                      child: const Icon(
                        Icons.fullscreen_sharp,
                        color: Colors.black,
                        size: 40,
                      )),
                ),
                Positioned(
                  bottom: 30,
                  left: 60,
                  right: 60,
                  child: Column(
                    children: [
                      ButtonWidget(
                        onPressed: () async {
                          await navigateToRandomLocation();
                        },
                        padding: const EdgeInsets.all(10),
                        buttonFixedSize: const Size.fromWidth(double.maxFinite),
                        buttonColor: const Color(0XFF2EC1EF),
                        child: const Text(
                          "Teleport me to somewhere random",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ButtonWidget(
                        onPressed: () async {
                          await navigateToLocation(LatLng(snapshot.data!.latitude, snapshot.data!.longitude));
                        },
                        padding: const EdgeInsets.all(10),
                        buttonFixedSize: const Size.fromWidth(double.maxFinite),
                        buttonColor: const Color(0XFF9A2EEF),
                        child: const Text(
                          "Bring me back home",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
