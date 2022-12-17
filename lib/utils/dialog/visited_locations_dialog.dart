import 'package:flutter/material.dart';
import 'package:google_map_test_task/views/widgets/button_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<void> showVisitedLocationsDialog({
  required BuildContext context,
  required List<LatLng> visitedLocations,
  required LatLng currentLocation,
}) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
        insetPadding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: ButtonWidget(
                  onPressed: (() {
                    Navigator.pop(context);
                  }),
                  buttonColor: Colors.black.withOpacity(0.7),
                  radiusAll: 16,
                  padding: const EdgeInsets.all(7),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(18).copyWith(top: 20),
              child: Column(
                children: [
                  Text(
                    'Current Location',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Latitude: ${currentLocation.latitude.toStringAsFixed(6)}\n'
                    'Longitude: ${currentLocation.longitude.toStringAsFixed(6)}',
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Visited Locations',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 400,
                    ),
                    child: ListView.builder(
                      itemCount: visitedLocations.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            'Location ${index + 1}',
                            style: Theme.of(context).textTheme.headline6,
                            textAlign: TextAlign.center,
                          ),
                          subtitle: Text(
                            'Latitude: ${visitedLocations[index].latitude.toStringAsFixed(4)}\n'
                            'Longitude: ${visitedLocations[index].longitude.toStringAsFixed(4)}',
                            style: const TextStyle(fontSize: 18, color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
