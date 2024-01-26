import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:my_weather/core/config/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_location_permission_controller.g.dart';

@riverpod
class GetLocationPermissionController
    extends _$GetLocationPermissionController {
  @override
  Future<LocationPermission> build() async {
    if (!Platform.isAndroid && !Platform.isIOS) {
      return LocationPermission.always;
    }

    try {
      final permission = await Geolocator.requestPermission();
      return permission;
    } catch (e, stack) {
      logger.e(
        'Failed to get location permission $e',
        stackTrace: stack,
      );

      rethrow;
    }
  }
}
