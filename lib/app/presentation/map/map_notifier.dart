import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:presensi/core/provider/app_provider.dart';

class MapNotifier extends AppProvider {
  MapNotifier() {
    init();
  }

  MapController _mapController = MapController.withPosition(
      initPosition: GeoPoint(latitude: -6.17511, longitude: 106.8272));
  MapController get mapController => _mapController;

  @override
  void init() {}
}
