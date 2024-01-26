import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/config/logger.dart';
import '../../../../core/utils/extensions/location_permission.dart';
import 'get_location_permission_controller.dart';

part 'get_my_location_controller.g.dart';

@riverpod
class GetMyLocationController extends _$GetMyLocationController {
  @override
  AsyncValue<Position> build() {
    final permission = ref.watch(getLocationPermissionControllerProvider);
    return permission.when(
      loading: () => const AsyncLoading(),
      error: (error, stack) => AsyncError(error, stack),
      data: (permission) {
        if (!permission.isGranted) {
          return AsyncError('Permission denied', StackTrace.current);
        }

        _getMyLocation();
        return const AsyncLoading();
      },
    );
  }

  Future<void> _getMyLocation() async {
    state = const AsyncLoading();
    try {
      final position = await Geolocator.getCurrentPosition();
      state = AsyncData(position);
    } catch (e, stack) {
      logger.e('Failed to get location', error: e, stackTrace: stack);
      state = AsyncError(e, StackTrace.current);
    }
  }
}
