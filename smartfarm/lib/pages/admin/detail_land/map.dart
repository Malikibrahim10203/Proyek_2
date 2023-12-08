import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:smartfarm/pages/farmer/landfarmer.dart';
import 'package:latlong2/latlong.dart' as latLng;

class MapAdmin extends StatefulWidget {
  const MapAdmin({super.key, required this.lat, required this.lon});

  final lat;
  final lon;

  @override
  State<MapAdmin> createState() => _MapAdminState();
}

class _MapAdminState extends State<MapAdmin> {


  late double latitude;
  var longitude;


  @override
  void initState() {
    // TODO: implement initState

    latitude = widget.lat;
    longitude = widget.lon;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
        ),
        title: Text("LandMaps", style: TextStyle(color: Colors.black54),),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              center: latLng.LatLng(latitude, longitude),
              zoom: 15.2,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: latLng.LatLng(latitude, longitude),
                    width: 80,
                    height: 80,
                    builder: (context) => Icon(Icons.pin_drop, color: Colors.red, size: 30),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
