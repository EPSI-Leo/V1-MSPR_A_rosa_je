import 'package:arosa_je/core/core.dart';
import 'package:arosa_je/modules/app/app_initialcenter_providers.dart';
import 'package:arosa_je/modules/map/notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class MapView extends ConsumerWidget {
  MapView({
    super.key,
  });

  final List<Marker> markers = [];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    LatLng? initialCenter = ref.read(initialCenterProvider).value;
    final plantsList = ref.watch(allPlantsProvider);

    return plantsList.when(
      data: (plants) {
        if (plants != null) {
          for (final plant in plants.plants!) {
            markers.add(
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(plant.latitude!, plant.longitude!),
                child: IconButton(
                  onPressed: () {
                    /*Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PlantDetailScreen(id: marker.id)),
                          );*/
                  },
                  icon: const Image(
                    image: AssetImage('lib/assets/images/icon.png'),
                  ),
                ),
              ),
            );
          }
        }
        return map(const LatLng(45.54705, 5.97151), markers); // initialCenter!
      },
      loading: () => const Center(
        child: Center(
          child: CircularProgressIndicator(color: Colors.black),
        ),
      ),
      error: (error, stackTrace) {
        printDebug(error.toString());
        return map(const LatLng(45.54705, 5.97151), markers); // initialCenter!
      },
    );
  }

  Widget map(LatLng initialCenter, List<Marker> markers) {
    return Expanded(
      child: SizedBox.expand(
        child: FlutterMap(
          options: MapOptions(
            initialCenter: initialCenter,
            initialZoom: 16.0,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            ),
            RichAttributionWidget(
              attributions: [
                TextSourceAttribution(
                  'OpenStreetMap contributors',
                  onTap: () => launchUrl(
                    Uri.parse('https://openstreetmap.org/copyright'),
                  ),
                ),
              ],
            ),
            MarkerLayer(
              markers: [for (int i = 0; i < markers.length; i++) markers[i]],
            ),
          ],
        ),
      ),
    );
  }
}
