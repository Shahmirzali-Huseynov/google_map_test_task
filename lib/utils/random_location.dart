// ignore_for_file: constant_identifier_names

import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';

const double MIN_LATITUDE = -7.57216793459;
const double MAX_LATITUDE = 49.959999905;
const double MIN_LONGITUDE = 1.68153079591;
const double MAX_LONGITUDE = 58.6350001085;

// Generates a random latitude and longitude
LatLng getRandomCoordinate() {
  final Random random = Random();
  final double latitude = MIN_LATITUDE + (MAX_LATITUDE - MIN_LATITUDE) * random.nextDouble();
  final double longitude = MIN_LONGITUDE + (MAX_LONGITUDE - MIN_LONGITUDE) * random.nextDouble();
  return LatLng(latitude, longitude);
}
