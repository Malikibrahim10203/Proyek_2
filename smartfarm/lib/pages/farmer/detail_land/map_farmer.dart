import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MapFarmer extends StatefulWidget {
  const MapFarmer({Key? key}) : super(key: key);

  @override
  State<MapFarmer> createState() => _MapFarmerState();
}

class _MapFarmerState extends State<MapFarmer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Lottie.asset('assets/img/sun_rainny.json'),
      ),
    );
  }
}
