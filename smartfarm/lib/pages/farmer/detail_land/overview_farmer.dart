import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:lottie/lottie.dart' as lottie;
import 'package:smartfarm/config/apiWeather.dart';
import 'package:smartfarm/event/event_db.dart';
import 'package:smartfarm/model/land.dart';
import 'package:smartfarm/model/weather.dart';
import 'package:smartfarm/pages/admin/detail_land/map.dart';
import 'package:smartfarm/pages/farmer/detail_land/manage_device_farmer.dart';
import 'package:smartfarm/pages/farmer/detail_land/map_farmer.dart';
import 'package:smartfarm/pages/farmer/deteksi/deteksi.dart';
import 'package:smartfarm/pages/farmer/landfarmer.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart' as latLng;


class OverviewFarmer extends StatefulWidget {
  const OverviewFarmer({super.key, required this.id});

  final String id;

  @override
  State<OverviewFarmer> createState() => _OverviewState();
}

class _OverviewState extends State<OverviewFarmer> {


  String? parameter;
  List<Land> listLand = [];
  Weather? _weather;

  final panen = Duration(
      days: 90
  );

  @override
  void initState() {
    // TODO: implement initState
    parameter = widget.id;
    getLand();
    super.initState();
  }


  void getLand() async {
    listLand = await EventDB.getDetailLand(parameter??'');
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        title: Text("Lands Farmer", style: TextStyle(color: Color(0xff545454)),),
        centerTitle: true,
        backgroundColor: Color(0xffFFFFFF),
        iconTheme: IconThemeData(
            color: Color(0xff545454)
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20, top:20, right: 20 ),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width,
                child: Container(
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: listLand.length,
                            itemBuilder: (context, index) {
                              Land land = listLand[index];
                              DateTime datePlanted = DateTime.parse("${land.cropPlantedAt}");
                              DateTime dateNow = DateTime.now();
                              Duration diff = datePlanted.difference(dateNow);

                              String coordinate = land.polygon??'';



                              List<dynamic> map = coordinate.split(RegExp(r'[ ,\s]'));
                              double latitude = double.parse(map[0]);
                              double longitude = double.parse(map[1]);



                              if (diff.abs() >= panen) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 1,
                                      height: MediaQuery.of(context).size.height * 0.3,
                                      child: FlutterMap(
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
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      child: ListTile(
                                          title: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    land.name??'',
                                                    style: TextStyle(
                                                        fontSize: 30,
                                                        fontWeight: FontWeight.w700,
                                                        color: Color(0xff545454)
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    land.description??'',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.w400,
                                                        color: Color(0xff8A8A8A)
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(Icons.calendar_month, size: 16,),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    '${diff.abs().inDays.toString()} hari',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xffD6D3D3)
                                          ),
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: ListTile(
                                        leading: Container(
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    right: BorderSide(
                                                        color: Color(0xffD6D3D3),
                                                        width: 1
                                                    )
                                                )
                                            ),
                                            padding: EdgeInsets.all(10),
                                            child: Image.asset("assets/img/temprature.png", width: 20,)
                                        ),
                                        title: Text(
                                          "Temprature",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        subtitle: Text(
                                          '${diff.abs().inDays.toString()} °C',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xffD6D3D3)
                                          ),
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: ListTile(
                                        leading: Container(
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  right: BorderSide(
                                                      color: Color(0xffD6D3D3),
                                                      width: 1
                                                  )
                                              )
                                          ),
                                          padding: EdgeInsets.all(10),
                                          child: Image.asset("assets/img/humidity.png", width: 20),
                                        ),
                                        title: Text(
                                          "Humidity",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        subtitle: Text(
                                          '${diff.abs().inDays.toString()} %',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xffD6D3D3)
                                          ),
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: ListTile(
                                        leading: Container(
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  right: BorderSide(
                                                      color: Color(0xffD6D3D3),
                                                      width: 1
                                                  )
                                              )
                                          ),
                                          padding: EdgeInsets.all(10),
                                          child: Image.asset("assets/img/kelembaban_tanah.png", width: 20),
                                        ),
                                        title: Text(
                                          "Kelembaban Tanah",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        subtitle: Text(
                                          '${diff.abs().inDays.toString()} % RH',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xffD6D3D3)
                                          ),
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: ListTile(
                                        leading: Container(
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  right: BorderSide(
                                                      color: Color(0xffD6D3D3),
                                                      width: 1
                                                  )
                                              )
                                          ),
                                          padding: EdgeInsets.all(10),
                                          child: Image.asset("assets/img/ph_tanah.png", width: 20),
                                        ),
                                        title: Text(
                                          "PH Tanah",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        subtitle: Text(
                                          '${diff.abs().inDays.toString()}',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xffD6D3D3)
                                          ),
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: ListTile(
                                        leading: Container(
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  right: BorderSide(
                                                      color: Color(0xffD6D3D3),
                                                      width: 1
                                                  )
                                              )
                                          ),
                                          padding: EdgeInsets.all(10),
                                          child: Image.asset("assets/img/natrium.png", width: 20),
                                        ),
                                        title: Text(
                                          "Natrium",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        subtitle: Text(
                                          '${diff.abs().inDays.toString()}',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xffD6D3D3)
                                          ),
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: ListTile(
                                        leading: Container(
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  right: BorderSide(
                                                      color: Color(0xffD6D3D3),
                                                      width: 1
                                                  )
                                              )
                                          ),
                                          padding: EdgeInsets.all(10),
                                          child: Image.asset("assets/img/phosporus.png", width: 20),
                                        ),
                                        title: Text(
                                          "Phosphor",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        subtitle: Text(
                                          '${diff.abs().inDays.toString()}',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xffD6D3D3)
                                          ),
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: ListTile(
                                        leading: Container(
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  right: BorderSide(
                                                      color: Color(0xffD6D3D3),
                                                      width: 1
                                                  )
                                              )
                                          ),
                                          padding: EdgeInsets.all(10),
                                          child: Image.asset("assets/img/kalium.png", width: 20),
                                        ),
                                        title: Text(
                                          "Kalium",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        subtitle: Text(
                                          '${diff.abs().inDays.toString()}',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(11)),
                                        color: Colors.red,
                                      ),
                                      height: 30,
                                      width: 110,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Belum Panen",
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(" Cuaca", style: TextStyle(fontSize: 16),),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Card(
                                      color: Colors.black45,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        side: BorderSide(
                                          width: 0.5,
                                          color: Color(0xffD5D5D5),
                                        ),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.only(left: 20,right: 20, top: 20),
                                        child: FutureBuilder(
                                          builder: (context, snapshot) {
                                            if (snapshot != null) {
                                              this._weather = snapshot.data;
                                              if (this._weather == null) {
                                                return CircularProgressIndicator();
                                              } else {
                                                return  weatherBox(_weather!);
                                              }
                                            } else {
                                              return CircularProgressIndicator();
                                            }
                                          },
                                          future: getCurrentWeather(),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                );
                              } else if(diff.abs() <= panen) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 1,
                                      height: MediaQuery.of(context).size.height * 0.3,
                                      child: FlutterMap(
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
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      child: ListTile(
                                          title: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    land.name??'',
                                                    style: TextStyle(
                                                        fontSize: 30,
                                                        fontWeight: FontWeight.w700,
                                                        color: Color(0xff545454)
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    land.description??'',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.w400,
                                                        color: Color(0xff8A8A8A)
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(Icons.calendar_month, size: 16,),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    '${diff.abs().inDays.toString()} hari',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xffD6D3D3)
                                          ),
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: ListTile(
                                        leading: Container(
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    right: BorderSide(
                                                        color: Color(0xffD6D3D3),
                                                        width: 1
                                                    )
                                                )
                                            ),
                                            padding: EdgeInsets.all(10),
                                            child: Image.asset("assets/img/temprature.png", width: 20,)
                                        ),
                                        title: Text(
                                          "Temprature",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        subtitle: Text(
                                          '${diff.abs().inDays.toString()} °C',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xffD6D3D3)
                                          ),
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: ListTile(
                                        leading: Container(
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  right: BorderSide(
                                                      color: Color(0xffD6D3D3),
                                                      width: 1
                                                  )
                                              )
                                          ),
                                          padding: EdgeInsets.all(10),
                                          child: Image.asset("assets/img/humidity.png", width: 20),
                                        ),
                                        title: Text(
                                          "Humidity",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        subtitle: Text(
                                          '${diff.abs().inDays.toString()} %',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xffD6D3D3)
                                          ),
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: ListTile(
                                        leading: Container(
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  right: BorderSide(
                                                      color: Color(0xffD6D3D3),
                                                      width: 1
                                                  )
                                              )
                                          ),
                                          padding: EdgeInsets.all(10),
                                          child: Image.asset("assets/img/kelembaban_tanah.png", width: 20),
                                        ),
                                        title: Text(
                                          "Kelembaban Tanah",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        subtitle: Text(
                                          '${diff.abs().inDays.toString()} % RH',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xffD6D3D3)
                                          ),
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: ListTile(
                                        leading: Container(
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  right: BorderSide(
                                                      color: Color(0xffD6D3D3),
                                                      width: 1
                                                  )
                                              )
                                          ),
                                          padding: EdgeInsets.all(10),
                                          child: Image.asset("assets/img/ph_tanah.png", width: 20),
                                        ),
                                        title: Text(
                                          "PH Tanah",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        subtitle: Text(
                                          '${diff.abs().inDays.toString()}',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xffD6D3D3)
                                          ),
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: ListTile(
                                        leading: Container(
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  right: BorderSide(
                                                      color: Color(0xffD6D3D3),
                                                      width: 1
                                                  )
                                              )
                                          ),
                                          padding: EdgeInsets.all(10),
                                          child: Image.asset("assets/img/natrium.png", width: 20),
                                        ),
                                        title: Text(
                                          "Natrium",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        subtitle: Text(
                                          '${diff.abs().inDays.toString()}',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xffD6D3D3)
                                          ),
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: ListTile(
                                        leading: Container(
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  right: BorderSide(
                                                      color: Color(0xffD6D3D3),
                                                      width: 1
                                                  )
                                              )
                                          ),
                                          padding: EdgeInsets.all(10),
                                          child: Image.asset("assets/img/phosporus.png", width: 20),
                                        ),
                                        title: Text(
                                          "Phosphor",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        subtitle: Text(
                                          '${diff.abs().inDays.toString()}',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xffD6D3D3)
                                          ),
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: ListTile(
                                        leading: Container(
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  right: BorderSide(
                                                      color: Color(0xffD6D3D3),
                                                      width: 1
                                                  )
                                              )
                                          ),
                                          padding: EdgeInsets.all(10),
                                          child: Image.asset("assets/img/kalium.png", width: 20),
                                        ),
                                        title: Text(
                                          "Kalium",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        subtitle: Text(
                                          '${diff.abs().inDays.toString()}',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(11)),
                                        color: Colors.red,
                                      ),
                                      height: 30,
                                      width: 110,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Belum Panen",
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(" Cuaca", style: TextStyle(fontSize: 16),),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Card(
                                      color: Colors.black45,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        side: BorderSide(
                                          width: 0.5,
                                          color: Color(0xffD5D5D5),
                                        ),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.only(left: 20,right: 20, top: 20),
                                        child: FutureBuilder(
                                          builder: (context, snapshot) {
                                            if (snapshot != null) {
                                              this._weather = snapshot.data;
                                              if (this._weather == null) {
                                                return CircularProgressIndicator();
                                              } else {
                                                return  weatherBox(_weather!);
                                              }
                                            } else {
                                              return CircularProgressIndicator();
                                            }
                                          },
                                          future: getCurrentWeather(),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    )
                ),
              )
            ],
          ),
        ),
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {

            },
            child: Icon(Icons.settings, color: Color(0xff545454),),
            backgroundColor: Colors.white,
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ManageDeviceFarmer(id: widget.id)));
            },
            child: Icon(Icons.sensor_window, color: Color(0xff545454),),
            backgroundColor: Colors.white,
          )
        ],
      ),
    );
  }
}

Widget weatherBox(Weather _weather) {



  return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        animasi(_weather.description??''),
        Container(
            margin: const EdgeInsets.all(10.0),
            child:
            Text("${_weather.temp} °C",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xffECF1F7)),
            )
        ),
      ]
  );
}

Widget animasi(String cuaca) {

  /// String cuaca = "clear sky";

  String? alamat;

  if(cuaca.contains("clouds")) {
    alamat = "assets/animation/scattered_cloud.json";
  } else if (cuaca.contains("rain")){
    alamat = "assets/animation/sun_rainny.json";
  } else if (cuaca.contains("clear sky")){
    alamat = "assets/animation/clear_sky.json";
  }
  return lottie.Lottie.asset("$alamat", width: 50);

}

Future getCurrentWeather() async {
  late Weather weather;
  String city = "Indramayu";
  String apiKey = "803f29d900ba4586581fbe3d53e304dc";
  var url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric");

  final response = await http.get(url);

  if (response.statusCode == 200) {
    weather = Weather.fromJson(jsonDecode(response.body));
  }

  return weather;
}
