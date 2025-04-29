import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NearbyFiresMap extends StatefulWidget {
  const NearbyFiresMap({super.key});

  @override
  State<NearbyFiresMap> createState() => _NearbyFiresMapState();
}

class _NearbyFiresMapState extends State<NearbyFiresMap> {
  GoogleMapController? _mapController;
  bool _isLoading = true;
  String? _error;

  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(39.9334, 32.8597), // Türkiye'nin merkezi (Ankara)
    zoom: 5.5,
  );

  final Set<Marker> _markers = {
    const Marker(
      markerId: MarkerId('besiktas'),
      position: LatLng(41.0422, 29.0089),
      infoWindow: InfoWindow(
        title: 'Beşiktaş',
        snippet: 'Aktif Yangın',
      ),
    ),
    const Marker(
      markerId: MarkerId('manavgat'),
      position: LatLng(36.8641, 30.6319),
      infoWindow: InfoWindow(
        title: 'Manavgat',
        snippet: 'Aktif Yangın',
      ),
    ),
    const Marker(
      markerId: MarkerId('bornova'),
      position: LatLng(38.4192, 27.1287),
      infoWindow: InfoWindow(
        title: 'Bornova',
        snippet: 'Kontrol Altında',
      ),
    ),
  };

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _mapController = controller;
      _isLoading = false;
      _error = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.grey.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            children: [
              if (_error == null) // Sadece hata yoksa haritayı göster
                Positioned.fill(
                  child: GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: _initialPosition,
                    markers: _markers,
                    mapType: MapType.normal,
                    myLocationEnabled: false, // Konum özelliğini geçici olarak kapatalım
                    myLocationButtonEnabled: false,
                    zoomControlsEnabled: true,
                    compassEnabled: true,
                    padding: const EdgeInsets.only(bottom: 16, right: 16),
                  ),
                ),
              if (_isLoading)
                Positioned.fill(
                  child: Container(
                    color: Colors.grey[100],
                    child: const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFF3B30)),
                      ),
                    ),
                  ),
                ),
              if (_error != null)
                Positioned.fill(
                  child: Container(
                    color: Colors.grey[100],
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.error_outline,
                            color: Color(0xFFFF3B30),
                            size: 48,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Harita yüklenemedi',
                            style: TextStyle(
                              color: Color(0xFFFF3B30),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              _error!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }
} 