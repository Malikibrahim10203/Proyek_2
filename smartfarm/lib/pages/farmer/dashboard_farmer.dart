import 'package:flutter/material.dart';
import 'package:smartfarm/event/event_pref.dart';
import 'package:smartfarm/pages/farmer/devicefarmer.dart';
import 'package:smartfarm/pages/farmer/landfarmer.dart';
import 'package:smartfarm/pages/login.dart';


class DashboardFarmer extends StatefulWidget {
  const DashboardFarmer({Key? key}) : super(key: key);

  @override
  State<DashboardFarmer> createState() => _DashboardFarmerState();
}

class _DashboardFarmerState extends State<DashboardFarmer> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Color(0xffF5F7F8),
        resizeToAvoidBottomInset: false,
        body: Container(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 30, top: 50, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.account_circle_rounded,
                            size: 25,
                          ),
                          IconButton(
                            onPressed: () {
                              EventPref.clear();
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                            },
                            icon: Icon(
                                Icons.logout
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Hi, Admin')
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      height: 150,
                      width: MediaQuery.of(context).size.width*1,
                      child: Card(
                        color: Color(0xffC5E898),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(50)),
                        ),
                        child: Container(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      String userId = (await EventPref.getUser())?.id ?? "";
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => LandFarmer(id: "2")));
                                    },
                                    child: SizedBox(
                                      height: MediaQuery.of(context).size.height*0.15,
                                      width: MediaQuery.of(context).size.width*0.3,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          side: BorderSide(
                                            width: 1,
                                            color: Color(0xffD5D5D5),
                                          ),
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.all(15),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Icon(
                                                    Icons.map_outlined,
                                                    size: 25,
                                                    color: Color(0xff505050),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context).size.height*0.02,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Lahan",
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Devicefarmer()));
                                    },
                                    child: SizedBox(
                                      height: MediaQuery.of(context).size.height*0.15,
                                      width: MediaQuery.of(context).size.width*0.3,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          side: BorderSide(
                                            width: 1,
                                            color: Color(0xffD5D5D5),
                                          ),
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.all(15),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Icon(
                                                    Icons.hub_outlined,
                                                    size: 25,
                                                    color: Color(0xff505050),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context).size.height*0.02,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Device",
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.25,
                      width: MediaQuery.of(context).size.width*1,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(
                            width: 1,
                            color: Color(0xffD5D5D5),
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Cuaca",
                                    style: TextStyle(
                                        fontSize: 17
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Kecamatan Lohbener, 15 Nov",
                                    style: TextStyle(
                                        fontSize: 12
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "29°C",
                                    style: TextStyle(
                                        fontSize: 20
                                    ),
                                  ),
                                  Text(
                                    "Hari ini hujan deras",
                                    style: TextStyle(
                                        fontSize: 10
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Icon(
                                    Icons.cloudy_snowing,
                                    size: 100,
                                    color: Colors.grey,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
