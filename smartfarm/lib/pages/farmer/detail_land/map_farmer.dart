import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:smartfarm/pages/farmer/landfarmer.dart';
import 'package:latlong2/latlong.dart' as latLng;

class MapFarmer extends StatefulWidget {
  const MapFarmer({Key? key}) : super(key: key);

  @override
  State<MapFarmer> createState() => _MapFarmerState();
}

class _MapFarmerState extends State<MapFarmer> {

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
        title: Text("Maps Lands", style: TextStyle(color: Colors.black54),),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              center: latLng.LatLng(-6.407887427753435, 108.28272322578337),
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
                    point: latLng.LatLng(-6.407887427753435, 108.28272322578337),
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
