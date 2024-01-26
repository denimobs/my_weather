part of '../weather_page.dart';

class _LocationPermissionChecker extends ConsumerWidget {
  const _LocationPermissionChecker({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = getLocationPermissionControllerProvider;
    final locationPermission = ref.watch(provider);

    return locationPermission.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stack) => Center(
        child: Text(error.toString()),
      ),
      data: (permission) {
        if (permission.isDenied) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_disabled,
                  size: 100,
                  color: Theme.of(context).disabledColor,
                ),
                const SizedBox(height: 16),
                Text(
                  'Location permission is denied',
                  textAlign: TextAlign.center,
                  style: context.textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => ref.invalidate(provider),
                  child: const Text('Request permission'),
                ),
              ],
            ),
          );
        }

        if (permission.isDeniedForever) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_disabled,
                  size: 100,
                  color: Theme.of(context).disabledColor,
                ),
                const SizedBox(height: 16),
                Text(
                  'Location permission is denied'
                  '\nenable it on app settings',
                  textAlign: TextAlign.center,
                  style: context.textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Geolocator.openAppSettings();
                  },
                  child: const Text('Open app settings'),
                ),
              ],
            ),
          );
        }

        return child;
      },
    );
  }
}
