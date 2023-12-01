import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smartfarm/model/device.dart';
import 'package:smartfarm/event/event_db.dart';
import 'package:smartfarm/event/event_pref.dart';
import 'package:smartfarm/model/user.dart';
import 'package:smartfarm/pages/admin/detail_land/manage_device.dart';
import 'package:smartfarm/pages/admin/landadmin.dart';
import 'package:smartfarm/pages/admin/manage_users.dart';
import 'package:smartfarm/pages/login.dart';

class DashboardAdmin extends StatefulWidget {
  const DashboardAdmin({Key? key}) : super(key: key);



  @override
  State<DashboardAdmin> createState() => _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardAdmin> {

  List<Device> totalDevice = [];
  List<User> totalUser = [];

  void getDevice() async {
    totalDevice = await EventDB.getDevice();
    setState(() {});
  }

  void getUser() async {
    totalUser = await EventDB.getUser();
    setState(() {

    });
  }


  @override
  void initState() {
    getDevice();
    getUser();
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Color(0xff04bd6c),
        resizeToAvoidBottomInset: false,
        body: Container(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 30, top: 25, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Hi, Admin..',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (ctx) {
                                  return AlertDialog(
                                    title: Text("LogOut"),
                                    content: Text("Apakah anda yakin ingin keluar?"),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          EventPref.clear();
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                                        },
                                        child: Text("Ya"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: Icon(
                              Icons.logout,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: () async {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ManageUser(info: 1)));
                      },
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height*0.2,
                        width: MediaQuery.of(context).size.width*0.8,
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Lottie.asset("assets/animation/user.json", width: 100),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.05,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Manage User",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff3E3D67),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Berisi beberapa user yang \nterdaftar pada smartfarm",
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.black45,
                                          fontWeight: FontWeight.w100
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Stack(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.57,
                          width: MediaQuery.of(context).size.width*1,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30),
                              ),
                              side: BorderSide(
                                width: 1,
                                color: Color(0xffD5D5D5),
                              ),
                            ),
                            color: Color(0xffECF1F7),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/img/plantbg.png"),
                                  fit: BoxFit.cover
                                )
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width * 0.1,
                                      ),
                                      Text(
                                        "Menu",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Color(0xff3E3D67),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 100,
                                    width: MediaQuery.of(context).size.width*0.8,
                                    child: GestureDetector(
                                      onTap: () async {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => LandAdmin()));
                                      },
                                      child: SizedBox(
                                        height: MediaQuery.of(context).size.height*0.2,
                                        width: MediaQuery.of(context).size.width*0.8,
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          child: Container(
                                            padding: EdgeInsets.all(15),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Lottie.asset("assets/animation/land.json", width: 90),
                                                SizedBox(
                                                  width: MediaQuery.of(context).size.width * 0.05,
                                                ),
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Farmer Lands",
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.w600,
                                                        color: Color(0xff3E3D67),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      "Berisi beberapa lahan \nyang dimiliki oleh Farmer",
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.black45,
                                                          fontWeight: FontWeight.w100
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
        ),
      ),
    );
  }
}
