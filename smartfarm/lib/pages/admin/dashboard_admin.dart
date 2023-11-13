import 'package:flutter/material.dart';
import 'package:smartfarm/event/event_pref.dart';
import 'package:smartfarm/pages/admin/manage_device.dart';
import 'package:smartfarm/pages/admin/manage_users.dart';
import 'package:smartfarm/pages/login.dart';

class DashboardAdmin extends StatefulWidget {
  const DashboardAdmin({Key? key}) : super(key: key);



  @override
  State<DashboardAdmin> createState() => _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardAdmin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white, Color(0xffC7EEFF)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: Container(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 30, top: 50, right: 30),
                child: Column(
                  children: [
                    Container(
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
                      width: 420,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(
                            width: 1,
                            color: Color(0xffD5D5D5),
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(25),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "16°C",
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Color(0xff505050),
                                    ),
                                  ),
                                  Icon(
                                    Icons.wb_cloudy_outlined,
                                    size: 30,
                                    color: Color(0xff505050),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Cuaca",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ManageUser()));
                          },
                          child: SizedBox(
                            height: 150,
                            width: 170,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(
                                  width: 1,
                                  color: Color(0xffD5D5D5),
                                ),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(25),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.map_outlined,
                                          size: 30,
                                          color: Color(0xff505050),
                                        ),
                                        Text(
                                          "2",
                                          style: TextStyle(
                                              fontSize: 25
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 35,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Total Lahan",

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
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ManageDevice()));
                          },
                          child: SizedBox(
                            height: 150,
                            width: 170,
                            child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(
                                width: 1,
                                color: Color(0xffD5D5D5),
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(25),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.device_hub_outlined,
                                        size: 30,
                                        color: Color(0xff505050),
                                      ),
                                      Text(
                                        "2",
                                        style: TextStyle(
                                            fontSize: 25
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 35,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Total Device",

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
                    SizedBox(
                      height: 150,
                      width: 420,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(
                            width: 1,
                            color: Color(0xffD5D5D5),
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(25),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.device_hub_outlined,
                                    size: 30,
                                    color: Color(0xff505050),
                                  ),
                                  Text(
                                    "2",
                                    style: TextStyle(
                                        fontSize: 25
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Text(
                                      "Total User"
                                  )
                                ],
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
          ),
        ),
      ),
    );
  }
}
