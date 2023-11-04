import 'package:flutter/material.dart';
import 'package:smartfarm/event/event_pref.dart';
import 'package:smartfarm/pages/login.dart';

class DashboardAdmin extends StatefulWidget {
  const DashboardAdmin({Key? key}) : super(key: key);

  @override
  State<DashboardAdmin> createState() => _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 262,
            child: Container(
              color: Color(0xff5369FE),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "SmartFarm",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          EventPref.clear();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: Text('LogOut', style: TextStyle(color: Colors.white),),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            onPressed: (){},
                            icon: Icon(
                              Icons.map,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Total Lahan",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "2",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: (){},
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Total Pengguna",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "2",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: (){},
                            icon: Icon(
                              Icons.devices,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Total Device",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "2",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
