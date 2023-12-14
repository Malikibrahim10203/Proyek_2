import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:smartfarm/pages/farmer/add/tambah_lahan_farmer.dart';
import 'package:smartfarm/pages/farmer/edit/edit_land.dart';
import 'package:smartfarm/pages/farmer/landfarmer.dart';

class EditMapFarmer extends StatefulWidget {
  const EditMapFarmer({super.key, required this.id, required this.name, required this.description, required this.status, required this.date, required this.userId,required this.coordinate , required this.area});
  final id, name, description, status, date, userId, coordinate, area;

  @override
  State<EditMapFarmer> createState() => _EditMapFarmerState();
}

class _EditMapFarmerState extends State<EditMapFarmer> {
  late double lat;
  late double long;

  List<dynamic> map = [];

  double? latitude;
  double? longitude;


  @override
  void initState() {
    map = widget.coordinate.split(RegExp(r'[ ,\s]'));
    latitude = double.parse(map[0]);
    longitude = double.parse(map[1]);

    // TODO: implement initState
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
        title: Text("Maps Lands", style: TextStyle(color: Colors.black54),),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          OpenStreetMapSearchAndPick(
              center: LatLong(latitude!, longitude!),
              buttonColor: Color(0xff408CFF),
              buttonText: 'Set Location',
              onPicked: (pickedData) {
                lat = pickedData.latLong.latitude;
                long = pickedData.latLong.longitude;

                String coordinate = "$lat,$long";
                print(coordinate);

                Navigator.push(context, MaterialPageRoute(builder: (context)=>EditLand(id: widget.id, name: widget.name, description: widget.description, maps: coordinate, status: widget.status, date: widget.date, userId: widget.userId, area: widget.area )));

                /// print(pickedData.latLong.longitude);
                /// print(pickedData.address);
              }),
        ],
      ),
    );
  }
}


