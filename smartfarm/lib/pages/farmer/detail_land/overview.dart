import 'package:flutter/material.dart';
import 'package:smartfarm/event/event_db.dart';
import 'package:smartfarm/event/event_pref.dart';
import 'package:smartfarm/model/land.dart';
import 'package:smartfarm/pages/admin/detail_land/map.dart';
import 'package:smartfarm/pages/farmer/landfarmer.dart';
import 'package:intl/intl.dart';
import 'package:smartfarm/pages/admin/detail_land/manage_device.dart';


class Overview extends StatefulWidget {
  const Overview({super.key, required this.id});

  final String id;

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {


  String? parameter;
  List<Land> listLand = [];

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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 30, top:50, right: 30 ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () async {
                      String userId = (await EventPref.getUser())?.id ?? "";
                      Navigator.push(context, MaterialPageRoute(builder:(context)=>LandFarmer(id: userId)));
                    },
                    icon: Icon(
                      Icons.arrow_back_outlined,
                    ),

                  ), //pembuatan tombol akhir
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.22,
                  ),
                  Text("Lands Farmer"),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.height * 0.25,
                      color: Colors.black54,
                      child: Text("Maps", style: TextStyle(color: Colors.white),),
                      padding: EdgeInsets.only(left: 155, right: 155, top: 70),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 300,
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
                            if (diff.abs() >= panen) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                ],
                              );
                            } else if(diff.abs() <= panen) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                ],
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(
                Icons.home_outlined,
              ),
              onPressed: () { },
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(
                Icons.sensor_window,
              ),
              onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>ManageDevice(id: widget.id,)));},
            ),
            label: 'Device'
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(
                Icons.sensor_window,
              ),
              onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>Maps()));},
            ),
            label: 'Deteksi Padi'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.settings
              ),
              label: 'Settings'
          ),
        ],
      ),
    );
  }
}
