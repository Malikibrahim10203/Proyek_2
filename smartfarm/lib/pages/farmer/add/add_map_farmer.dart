import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:smartfarm/pages/farmer/landfarmer.dart';

class AddMapFarmer extends StatefulWidget {
  const AddMapFarmer({Key? key}) : super(key: key);

  @override
  State<AddMapFarmer> createState() => _AddMapFarmerState();
}

class _AddMapFarmerState extends State<AddMapFarmer> {
  late double lat;
  late double long;

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
          OpenStreetMapSearchAndPick(
              center: LatLong(-6.407887427753435, 108.28272322578337),
              buttonColor: Colors.green,
              buttonText: 'Set Location',
              onPicked: (pickedData) {
                lat = pickedData.latLong.latitude;
                long = pickedData.latLong.longitude;
                print(lat);
                print(pickedData.latLong.longitude);
                print(pickedData.address);
              }),
        ],
      ),
    );
  }
}

