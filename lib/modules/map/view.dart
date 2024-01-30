import 'package:arosa_je/modules/app/app_initialcenter_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomMarker {
  final String id;
  final LatLng location;
  final Image image;
  final String onPressed;

  CustomMarker(
      {required this.id,
      required this.location,
      required this.image,
      this.onPressed = ''});
}

class MapView extends ConsumerStatefulWidget {
  const MapView({super.key});

  @override
  ConsumerState<MapView> createState() => _MapViewState();
}

class _MapViewState extends ConsumerState<MapView> {
  // ignore: non_constant_identifier_names

//TODO a supp
  List<CustomMarker> markers = [];

  @override
  Widget build(BuildContext context) {
    // Récupérer la valeur de initialCenter depuis le fournisseur
    LatLng? initialCenter = ref.read(initialCenterProvider).value;

    markers = []; //TODO add markers

    return map(initialCenter!);
  }

  Widget map(LatLng initialCenter) {
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
              markers: markers
                  .map(
                    (marker) => Marker(
                      width: 80.0,
                      height: 80.0,
                      point: marker.location,
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
                              image: AssetImage('lib/assets/images/icon.png'))),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
