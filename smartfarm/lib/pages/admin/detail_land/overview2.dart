import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smartfarm/event/event_db.dart';
import 'package:smartfarm/model/land.dart';
import 'package:smartfarm/model/weather.dart';
import 'package:smartfarm/pages/admin/detail_land/map.dart';
import 'package:intl/intl.dart';
import 'package:smartfarm/pages/admin/detail_land/manage_device.dart';
import 'package:smartfarm/pages/admin/landadmin.dart';
import 'package:http/http.dart' as http;


class Overview extends StatefulWidget {
  const Overview({super.key, required this.id});

  final String id;

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {


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
      backgroundColor: Color(0xffF5F7F8),
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
          padding: EdgeInsets.only(left: 30, top:50, right: 30 ),
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

                              List<dynamic> map = coordinate.split(" ");
                              double latitude = double.parse(map[0]);
                              double longitude = double.parse(map[1]);

                              if (diff.abs() >= panen) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MapAdmin(lat: latitude, lon: longitude)));
                                        },
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Card(
                                                child: Container(
                                                  padding: EdgeInsets.all(20),
                                                  child: Row(
                                                    children: [
                                                      Lottie.asset("assets/animation/maps.json", width: 100),
                                                      SizedBox(
                                                        width: MediaQuery.of(context).size.width * 0.05,
                                                      ),
                                                      Text(
                                                        "Maps Farmer",
                                                        style: TextStyle(
                                                            fontSize: 25,
                                                            color: Colors.black45
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: ListTile(
                                        title: Text(
                                          land.name??'',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        side: BorderSide(
                                          width: 0.5,
                                          color: Color(0xffD5D5D5),
                                        ),
                                      ),
                                      child: ListTile(
                                        leading: Container(
                                          padding: EdgeInsets.all(10),
                                          child: Icon(
                                              Icons.description
                                          ),
                                        ),
                                        title: Text(
                                          "Deskripsi",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        subtitle: Text(
                                          land.description??'',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        side: BorderSide(
                                          width: 0.5,
                                          color: Color(0xffD5D5D5),
                                        ),
                                      ),
                                      child: ListTile(
                                        leading: Container(
                                          padding: EdgeInsets.all(10),
                                          child: Icon(
                                              Icons.calendar_month
                                          ),
                                        ),
                                        title: Text(
                                          "Usia Tanaman",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        subtitle: Text(
                                          '${diff.abs().inDays.toString()} hari',
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
                                          color: Colors.green
                                      ),
                                      height: 30,
                                      width: 100,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Panen",
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
                                    Center(
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MapAdmin(lat: latitude, lon: longitude)));
                                        },
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Card(
                                                child: Container(
                                                  padding: EdgeInsets.all(20),
                                                  child: Row(
                                                    children: [
                                                      Lottie.asset("assets/animation/maps.json", width: 100),
                                                      SizedBox(
                                                        width: MediaQuery.of(context).size.width * 0.05,
                                                      ),
                                                      Text(
                                                        "Maps Farmer",
                                                        style: TextStyle(
                                                            fontSize: 25,
                                                            color: Colors.black45
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: ListTile(
                                        title: Text(
                                          land.name??'',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        side: BorderSide(
                                          width: 0.5,
                                          color: Color(0xffD5D5D5),
                                        ),
                                      ),
                                      child: ListTile(
                                        leading: Container(
                                          padding: EdgeInsets.all(10),
                                          child: Icon(
                                              Icons.description
                                          ),
                                        ),
                                        title: Text(
                                          "Deskripsi",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        subtitle: Text(
                                          land.description??'',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        side: BorderSide(
                                          width: 0.5,
                                          color: Color(0xffD5D5D5),
                                        ),
                                      ),
                                      child: ListTile(
                                        leading: Container(
                                          padding: EdgeInsets.all(10),
                                          child: Icon(
                                              Icons.calendar_month
                                          ),
                                        ),
                                        title: Text(
                                          "Usia Tanaman",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        subtitle: Text(
                                          '${diff.abs().inDays.toString()} hari',
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ManageDevice(id: widget.id)));
        },
        child: Icon(Icons.sensor_window, color: Color(0xff545454),),
        backgroundColor: Colors.white,
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
  return Lottie.asset("$alamat", width: 50);

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
