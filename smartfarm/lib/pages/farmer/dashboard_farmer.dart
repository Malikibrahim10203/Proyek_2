import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smartfarm/event/event_db.dart';
import 'package:smartfarm/event/event_pref.dart';
import 'package:smartfarm/model/device.dart';
import 'package:smartfarm/model/land.dart';
import 'package:smartfarm/model/user.dart';
import 'package:smartfarm/pages/farmer/add/tambah_lahan_farmer.dart';
import 'package:smartfarm/pages/farmer/detail_land/overview_farmer.dart';
import 'package:smartfarm/pages/farmer/landfarmer.dart';
import 'package:smartfarm/pages/login.dart';
import 'package:smartfarm/widget/info.dart';



class DashboardFarmer extends StatefulWidget {
  const DashboardFarmer({Key? key}) : super(key: key);

  @override
  State<DashboardFarmer> createState() => _DashboardFarmerState();
}

class _DashboardFarmerState extends State<DashboardFarmer> {

  List<Device> totalDevice = [];
  List<User> totalUser = [];
  late String userName ;

  void getDevice() async {
    totalDevice = await EventDB.getDevice();
    setState(() {});
  }

  void getUser() async {
    totalUser = await EventDB.getUser();
    userName = (await EventPref.getUser())?.name ?? "";
    setState(() {

    });
  }

  List<Land> listLand = [];
  void getLand() async {
    String userId = (await EventPref.getUser())?.id ?? "";
    listLand = await EventDB.getDetailLandbyUser(userId);
    setState(() {});
  }

  @override
  void initState() {
    getLand();
    getDevice();
    getUser();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF1F1F1),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xffFFFFFF),
          titleTextStyle: TextStyle(color: Colors.black),
          toolbarHeight: MediaQuery.of(context).size.height * 0.1,
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/img/profile.png", width: MediaQuery.of(context).size.width * 0.08,),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Hello, Dummy"),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Farmer", style: TextStyle(fontSize: 12),),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  // Image.asset("assets/img/Logo.png", width: MediaQuery.of(context).size.width * 0.3,),
                  Row(
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none, color: Color(0xff545454),)),
                      SizedBox(
                        width: 10,
                      ),
                      PopupMenuButton(
                        child: Image.asset("assets/img/menu.png", width: MediaQuery.of(context).size.width * 0.04),
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem<int>(
                              value: 0,
                              child: Row(
                                children: [
                                  Icon(Icons.settings, size: 15, color: Colors.black45,),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Setting", style: TextStyle(fontSize: 12),)
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              value: 1,
                              child: Row(
                                children: [
                                  Icon(Icons.logout, size: 15, color: Colors.black45,),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("LogOut", style: TextStyle(fontSize: 12),)
                                ],
                              ),
                            ),
                          ];
                        },
                        onSelected: (value) {
                          if(value == 0) {
                            print("settings");
                          } else if (value == 1) {
                            showDialog(
                              context: context,
                              builder: (ctx) {
                                return AlertDialog(
                                  title: Row(
                                    children: [
                                      Icon(Icons.warning_amber),
                                      Text("LogOut", style: TextStyle(fontSize: 12),)
                                    ],
                                  ),
                                  content: Text("Apakah anda yakin ingin keluar?", style: TextStyle(fontSize: 12),),
                                  actions: [
                                    OutlinedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Tidak"),
                                    ),
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
                          }
                        },
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        body: Container(
          child: SafeArea(
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 25, top: 20, right: 25),
                      color: Color(0xffFFFFFF),
                      height: MediaQuery.of(context).size.height * 0.23,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.school_outlined, size: 20, color: Color(0xff408CFF),),
                              SizedBox(width: 10,),
                              Text("Edukasi Pertanian", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),)
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.grass_outlined, size: 20, color: Color(0xff408CFF),),
                                  SizedBox(width: 10,),
                                  Text("Lahan Pertanian", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    String userId = (await EventPref.getUser())?.id ?? "";
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>TambahLahanFarmer(id: userId, coordinate: "0")));
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.add, size: 12,),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text("Tambah Lahan", style: TextStyle(fontSize: 9),)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
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

                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xffF1F1F1),
                                    ),
                                    child: ListTile(
                                      title: Container(
                                          padding: EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                              color: Color(0xffFFFFFF),
                                              border: Border(
                                                  left: BorderSide(
                                                    color: Color(0xffFF7B7B),
                                                    width: 3,
                                                  )
                                              )
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(land.name??'', style: TextStyle(color: Color(0xff737373), fontSize: 9),),
                                                  Text("${diff.abs().inDays.toString()} hari", style: TextStyle(color: Color(0xff737373), fontSize: 9),)
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Kurang Air dan Kurang Pupuk",
                                                    style: TextStyle(fontSize: 10),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: Color(0xff408CFF),
                                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                      ),
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => OverviewFarmer(id: land.id??'')));
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        )
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.document_scanner_outlined),
          elevation: 4,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border.symmetric(horizontal: BorderSide(color: Color(0xffCCCCCC), width: 2)),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,

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
                      Icons.history_edu,
                    ),
                    onPressed: () {

                    },
                  ),
                  label: 'Manage Account'
              ),
            ],
          ),
        )
    );
  }
}
