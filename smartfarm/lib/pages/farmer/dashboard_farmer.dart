import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smartfarm/event/event_pref.dart';
import 'package:smartfarm/pages/farmer/devicefarmer.dart';
import 'package:smartfarm/pages/farmer/landfarmer.dart';
import 'package:smartfarm/pages/login.dart';
import 'package:smartfarm/widget/info.dart';



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
                            'Hi, Farmer..',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              EventPref.clear();
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
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
                        String userId = (await EventPref.getUser())?.id ?? "";
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LandFarmer(id: userId)));
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
                                Lottie.asset("assets/animation/land.json", width: 90),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.05,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "My Lands",
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
                    SizedBox(
                      height: 30,
                    ),
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
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: BorderSide(
                                    width: 1,
                                    color: Color(0xffE0E0E0),
                                  ),
                                ),
                                color: Color(0xfffefefe),
                              ),
                            ),
                          ],
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
